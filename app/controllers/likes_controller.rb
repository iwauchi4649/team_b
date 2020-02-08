class LikesController < ApplicationController
  def create
    @like = current_user.likes.create(good_id: params[:good_id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @like = Like.find_by(good_id: params[:good_id], user_id: current_user.id)
    @like.destroy
    redirect_back(fallback_location: root_path)
  end

  private

  def set_variables
    @good = Good.find(params[:good_id])
    @id_name = "#like-link-#{@good.id}"
  end

end
