class LikesController < ApplicationController
  def create
    @like = Like.new(user_id: @current_user.id, good_id: params[:good_id])
    @like.save
    @good = Good.find_by(id: @like.good_id)
    @like_count = Like.where(good_id: params[:good_id]).count
  end

  def delete
    @like = Like.find_by(user_id: @current_user.id, good_id: params[:good_id])
    @good = Good.find_by(id: @like.good_id)
    @like.destroy
    @like_count = Like.where(good_id: params[:good_id]).count
  end
end
