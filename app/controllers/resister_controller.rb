class ResisterController < ApplicationController

  def new
    @user = User.new
  end
  def create
    @user = User.new(user_params)
    flash[:success] = @user 
      if @user.save
        flash[:success] = '新しいユーザーを登録しました。'
        redirect_to @user
      else
        flash.now[:danger] = 'ユーザーの登録に失敗しました。'
        render :new
      end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(user_params)

  end

end
