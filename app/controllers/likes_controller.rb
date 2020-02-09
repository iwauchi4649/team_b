class LikesController < ApplicationController
  before_action :set_variables

  def create
    @like = Like.new
    @like = current_user.likes.create(good_id: params[:good_id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @like = Like.find_by(good_id: params[:good_id], user_id: current_user.id)
    if @like.user_id == current_user.id
      @like.destroy
      redirect_back(fallback_location: root_path)
    else
      render "show"
    end
  end

  private

  def set_variables
    @good = Good.find(params[:good_id])
    @id_name = "#like-link-#{@good.id}"
  end
end
