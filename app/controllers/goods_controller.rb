class GoodsController < ApplicationController
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
      redirect_to "/goods"
    else
      render :new
    end
  end

  def index
    # 写真とgood_idを紐付ける
    @lady_category_id = Category.find_by(name: "レディース").indirect_ids
    @lady_goods = Good.where(category_id: @lady_category_id).order('id DESC')
    @lady_goods_id = Good.where(category_id: @lady_category_id).pluck(:id)
    # nameとfee用
    @lady_photo = Photo.where(good_id: @lady_goods_id).limit(10).order('id DESC')

    # 写真とgood_idを紐付ける
    @good_chanel_id = Good.where(brand:"シャネル").pluck(:id)
    @photo_chanel_id = Photo.where(good_id: @good_chanel_id).limit(10).order('id DESC')
    # nameとfee用
    @chanel = Good.where(brand:"シャネル").order('id DESC')
  end

  private

  def good_params
    params.require(:good).permit(:category_id, :brand, :name, :condition, :discription, :size, :delivery_type, :prefecture, :day, :fee, photos_attributes: [:id, :image])
  end
end
