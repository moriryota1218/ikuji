class UsersController < ApplicationController
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
       redirect_to signup_path, danger: '登録が失敗しました'
    end
  end

  def edit
    @user = User.find(params[:id])
    render 'edit'
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user, success: 'プロフィールを更新しました'
    else
      render :edit, danger: '更新が失敗しました'
    end
  end


  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :image,
     :s_introduction )
  end

end
