class GoodsController < ApplicationController

  before_action :set_good, only: [:show, :purchase, :pay, :done, :edit, :update, :destroy]
  before_action :get_category, only: [:show, :edit]
  before_action :set_address, only: [:pay]
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
    @good.update(good_params)
    # each do で並べた画像が photo
    # 新しくinputに追加された画像が photos_attributes
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
            Photo.find(before_img_id).destroy unless update_images_ids.include?("#{before_img_id}") 
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
        redirect_back(fallback_location: root_path, alert: '未入力項目があるか、入力された値が正しくありません。')
      end
    else
      redirect_back(fallback_location: root_path, alert: '画像がありません')
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
    if @good.photos.length != 0
      if @good.valid?
        @good.save!
        redirect_to root_path
      else
        redirect_back(fallback_location: root_path, alert: '未入力項目があるか、入力された値が正しくありません。')
      end
    else
      redirect_back(fallback_location: root_path, alert: '画像がありません')
    end
  end

  def index
    
  end

  def show
    if user_sign_in?
      render :show
    else
      redirect_to root_path
    end
    @user_good = Good.where(user_id: @good.user.id).where.not(id:params[:id]).limit(6)
    @brand_good = Good.where(user_id: @good.user.id).where(brand: @good.brand).where.not(id:params[:id]).limit(6)
  end
  

  def search_result
    # Viewのformで取得したデータをモデルに渡す。
    if params[:name].present?
      @goods = Good.where('name LIKE ?', "%#{params[:name]}%")
    else
      @goods = Good.none
    end
  end
  
  def destroy
    @good = Good.find_by(id: params[:id])
    if @good.user_id == current_user.id
      if @good.destroy
        redirect_to(root_path)
      else
        redirect_back(fallback_location: root_path, alert: '不正なアクセスです')
      end
    else
      redirect_back(fallback_location: root_path, alert: '不正なアクセスです')
    end
  end

  def purchase
  end

  def done
  end
  
  def pay
    @good = Good.find(params[:id])
    @good.update(buyer_id: current_user.id)
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    charge = Payjp::Charge.create(
    amount: @good.fee,
    card: params['payjp-token'],
    currency: 'jpy'
    )
    redirect_to done_goods_path
  end

  private

  def good_params
    params.require(:good).permit(:category_id, :brand, :name, :condition, :discription, :size, :delivery_type, :prefecture, :day, :fee, photos_attributes: [:id, :image]).merge(user_id: current_user.id)
  end

  def set_good
    @good = Good.includes([:user, :photos, :category]).find(params[:id])
  end

  def address_params
    params.require(:address).permit(:user_id, :banchi, :potal_code, :municipalties, :buildname).merge(user_id: current_user.id)
  end

  def set_address
    @address = Address.find(params[:id])
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
      instance_variable_set("@cat_no#{num}", goods)
    end
  end

  def index_brand_set
    array = ["シャネル","ルイヴィトン","シュプリーム","ナイキ"]
      for string in array do
        brands = Good.where(brand: string).order("id DESC").limit(10)
        instance_variable_set("@brand_no#{string}", brands)
    end
  end
end

def correct_user
  @micropost = current_user.microposts.find_by(id: params[:id])
    unless @micropost
      redirect_to root_url
    end
end