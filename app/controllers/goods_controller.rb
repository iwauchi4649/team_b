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
    @lady_category_id = Category.find_by(name: "レディース").indirect_ids
    @lady_goods = Good.where(category_id: @lady_category_id)
    @lady_goods_id = Good.where(category_id: @lady_category_id).pluck(:id)
    @lady_photo = Photo.where(good_id: @lady_goods_id)
  end

  private

  def good_params
    params.require(:good).permit(:category_id, :brand, :name, :condition, :discription, :size, :delivery_type, :prefecture, :day, :fee, photos_attributes: [:id, :image])
  end
end
