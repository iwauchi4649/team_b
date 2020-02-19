class GoodsController < ApplicationController
  before_action :set_good, only: [:show, :edit, :update, :destroy]
  before_action :get_category, only: [:show, :edit]
  before_action :index_category_set, only: :index
  before_action :index_brand_set, only: :index

  def new
    @good = Good.new
    @good.photos.build()
    @category_parent_array = Category.where(ancestry: nil).pluck(:name)
  end

  def edit
    @category_id = @good.category_id
    @category_parents_array = Category.where(ancestry: nil).pluck(:name)
    @category_parent = Category.find(@category_id).parent.parent
    @category_children_array = @category_parent.children.pluck(:name)
    @category_child = Category.find(@category_id).parent
    @category_grandchildren_array = @category_child.children.pluck(:name, :id)
    @category_grandchild = Category.find(@category_id)
  end

  def update
    # each do で並べた画像が image
    # 新しくinputに追加された画像が image_attributes
    # この二つがない時はupdateしない
    if params[:good].keys.include?("photo") || params[:good].keys.include?("photos_attributes") 
      if @good.valid?
        if params[:good].keys.include?("photo") 
        # dbにある画像がedit画面で一部削除してるか確認
          update_images_ids = params[:good][:photo].values #投稿済み画像 
          before_images_ids = @good.photos.ids
          #  商品に紐づく投稿済み画像が、投稿済みにない場合は削除する
          # @product.images.ids.each doで、一つずつimageハッシュにあるか確認。なければdestroy
          before_images_ids.each do |before_img_id|
            Photo.find(before_img_id).destroy unless update_image_ids.include?("#{before_img_id}") 
          end
        else
          # imageハッシュがない = 投稿済みの画像をすべてedit画面で消しているので、商品に紐づく投稿済み画像を削除する。
          # @product.images.destroy = nil と削除されないので、each do で一つずつ削除する
          before_images_ids.each do |before_img_id|
            Image.find(before_img_id).destroy 
          end
        end
        @good.update(good_params)
        redirect_to root_path, notice: "商品を更新しました"
      else
        render 'edit'
      end
    else
      redirect_back(fallback_location: root_path,flash: {success: '画像がありません'})
    end
  end

  def get_category_children
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end

  def get_category_grandchildren
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end

  def create
    @good = Good.new(good_params)
    respond_to do |format|
      if @good.save!
          params[:good_photos][:image].each do |image|
            @good.photos.create(image: image, good_id: @good.id)
          end
        format.html{redirect_to root_path}
      else
        @good.photos.build
        format.html{render action: 'new'}
      end
    end
  end

  def index
    # シャネル新着アイテム
    # 写真とgood_idを紐付ける
    @good_chanel_id = Good.where(brand:"シャネル").pluck(:id)
    @photo_chanel_id = Photo.where(good_id: @good_chanel_id).limit(10).order('id DESC')
    # nameとfee用
    @chanel = Good.where(brand:"シャネル").order('id DESC')

    # ルイヴィトン新着アイテム
    @good_vuitton_id = Good.where(brand:"ルイヴィトン").pluck(:id)
    @photo_vuitton_id = Photo.where(good_id: @good_vuitton_id).limit(10).order('id DESC')
    @vuitton = Good.where(brand:"ルイヴィトン").order('id DESC')

    # シュプリーム新着アイテム
    @good_supreme_id = Good.where(brand:"シュプリーム").pluck(:id)
    @photo_supreme_id = Photo.where(good_id: @good_supreme_id).limit(10).order('id DESC')
    @supreme = Good.where(brand:"シュプリーム").order('id DESC')

    # ナイキ新着アイテム
    @good_nike_id = Good.where(brand:"ナイキ").pluck(:id)
    @photo_nike_id = Photo.where(good_id: @good_nike_id).limit(10).order('id DESC')
    @nike = Good.where(brand:"ナイキ").order('id DESC')
  end

  def show
    @user_good = Good.where(user_id: @good.user.id).where.not(id:params[:id]).limit(6)
    @brand_good = Good.where(user_id: @good.user.id).where(brand: @good.brand).where.not(id:params[:id]).limit(6)
  end

  def destroy
    @good = Good.find_by(id: params[:id])
    if @good.user_id == current_user.id && @good.destroy
      redirect_to(root_path)
      else
        render "show"
      end
  end
  private

  def good_params
    params.require(:good).permit(:category_id, :brand, :name, :condition, :discription, :size, :delivery_type, :prefecture, :day, :fee, photos_attributes: [:image]).merge(user_id: current_user.id)
  end

  def set_good
    @good = Good.includes([:user, :photos, :category,]).find(params[:id])
  end

  def registered_image_params
    params.require(:registered_images_ids).permit({ids: []})
  end

  def get_category
    @grand_category = Category.find(@good.category_id,)
    @child_category = @grand_category.parent
    @prent_category = @child_category.parent
  end

  def set_good
    @good = Good.includes([:user, :photos, :category]).find(params[:id])
  end

  def index_category_set
  array = [1, 2, 3, 4]
    for num in array do
      search_anc = Category.where('ancestry LIKE(?)', "#{num}/%")
      ids = []
      search_anc.each do |i|
        ids << i[:id]
      end
      goods = Good.where(category_id: ids).order("id DESC").limit(10)
      goods_id = Good.where(category_id: ids).pluck(:id)
      goods_images = []
      goods_id.each do |i|
        goods_images << Photo.where(good_id: i).order("id DESC")
      end
      instance_variable_set("@cat_no#{num}", goods)
      instance_variable_set("@img_no#{num}", goods_images)
    end
  end

  def index_brand_set
    array = ["シャネル","ルイヴィトン","シュプリーム","ナイキ"]
      for string in array do
        brands = Good.where(brand: string).order("id DESC").limit(10)
        brands_id = Good.where(brand: string).pluck(:id)
        brands_images = []
        brands_id.each do |i|
          brands_images << Photo.where(good_id: i).order("id DESC")
      end
      instance_variable_set("@brand_no#{string}", brands)
      instance_variable_set("@img_no#{string}", brands_images)
    end
  end
end
