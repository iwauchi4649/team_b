class LikesController < ApplicationController
  def create
    @like = Like.create(user_id: current_user.id, good_id: params[:good_id])
    @likes = Like.where(good_id: params[:good_id])
    get_good
  end

  def destroy
    @like = Like.find_by(user_id: current_user.id, good_id: params[:good_id])
    @like.destroy
    @likes = Like.where(good_id: params[:good_id])
    get_good
  end

  def get_good
    @good = Good.find(params[:good_id])
  end
end
