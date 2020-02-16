class GoodsController < ApplicationController

  before_action :set_good, only: [:show]
  before_action :get_category, only: [:show, :edit]
  before_action :index_category_set, only: :index
  before_action :index_brand_set, only: :index

  def new
    @good = Good.new
    @good.photos.build()
    @category_parent_array = Category.where(ancestry: nil).pluck(:name)
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

  def get_category
    @grand_category = Category.find(@good.category_id,)
    @child_category = @grand_category.parent
    @prent_category = @child_category.parent
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
