class UsersController < ApplicationController
  def new
    @user = User.new(params[:user])
  end

  def create
    @user = User.new(user_params)
    if @user.save
       redirect_to root_path, success: '登録が完了しました'
    else
       redirect_to signup_path, danger: '登録が失敗しました'
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
