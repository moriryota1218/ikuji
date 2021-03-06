class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show, :edit, :update]

  def new
    @user = User.new(params[:user])
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
       redirect_to root_path, success: '登録が完了しました'
    else
       flash.now[:danger] = '登録が失敗しました'
       render :new
    end
  end

  def edit
    @user = User.find(params[:id])
    render 'edit'
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to @user, success: 'プロフィールを更新しました'
    else
      render :edit, danger: '更新が失敗しました'
    end
  end


  private
  def user_params
    params.require(:user).permit(:name, :email, :image, :s_introduction )
  end

end
