class GoodsController < ApplicationController

  before_action :set_good, only: [:show]
  # before_action :set_user, only: [:show]

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
    if @good.save!
      redirect_to root_path
    else
      render :new
    end
  end

  def index
    # レディース新着アイテム
    # 写真とgood_idを紐付ける
    @lady_category_id = Category.find_by(name: "レディース").indirect_ids
    @lady_goods = Good.where(category_id: @lady_category_id).order('id DESC')
    @lady_goods_id = Good.where(category_id: @lady_category_id).pluck(:id)
    # nameとfee用
    @lady_photo = Photo.where(good_id: @lady_goods_id).limit(10).order('id DESC')

    # メンズ新着アイテム
    @man_category_id = Category.find_by(name: "メンズ").indirect_ids
    @man_goods = Good.where(category_id: @man_category_id).order('id DESC')
    @man_goods_id = Good.where(category_id: @man_category_id).pluck(:id)
    @man_photo = Photo.where(good_id: @man_goods_id).limit(10).order('id DESC')

    # 家電・スマホ・カメラ新着アイテム
    @electricity_category_id = Category.find_by(name: "家電・スマホ・カメラ").indirect_ids
    @electricity_goods = Good.where(category_id: @electricity_category_id).order('id DESC')
    @electricity_goods_id = Good.where(category_id: @electricity_category_id).pluck(:id)
    @electricity_photo = Photo.where(good_id: @electricity_goods_id).limit(10).order('id DESC')

    # おもちゃ・ホビー・グッズ新着アイテム
    @hobby_category_id = Category.find_by(name: "おもちゃ・ホビー・グッズ").indirect_ids
    @hobby_goods = Good.where(category_id: @hobby_category_id).order('id DESC')
    @hobby_goods_id = Good.where(category_id: @hobby_category_id).pluck(:id)
    @hobby_photo = Photo.where(good_id: @hobby_goods_id).limit(10).order('id DESC')

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
    @user_good = Good.find(params[:id])
  end

  private

  def good_params
    params.require(:good).permit(:user_id, :category_id, :brand, :name, :condition, :discription, :size, :delivery_type, :prefecture, :day, :fee, photos_attributes: [:id, :image]).merge(user_id: current_user.id)
  end

  def set_good
    @good = Good.includes([:user, :photos, :category]).find(params[:id])
  end

  # def get_category
  #   @parent_category,@children_category,@grand_category = Category.find(@good.category_id,@good.child_category_id,@good.grand_child_category_id)
  # end

  # def set_user
  #   @user = User.includes(:goods).find(current_user) if user_signed_in?
  # end
end
