class GoodsController < ApplicationController
  def new
    @good = Good.new
    @good.photos.build()
    @category_parent_array = ["--"]
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
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
    if @good.save!
      redirect_to "/review/:review_id/mypage"
    else
      render :new
    end
  end

  private
  def good_params
    params.require(:good).permit(:category_id, :brand, :name, :condition, :discription, :size, :delivery_type, :prefecture, :day, :fee,photos_attributes: [:id, :image])
  end
end
