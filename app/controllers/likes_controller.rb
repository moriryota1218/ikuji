class LikesController < ApplicationController

  def new
    @like = Like.new
  end

  def create
    @like = Like.new(user_id: current_user.id, recipe_id: params[:recipe_id])
    @like.save
    redirect_to("/recipes/")
  end

  def destroy
    @like = Like.find_by(user_id: current_user.id, recipe_id: params[:recipe_id]).destroy

    redirect_to("/recipes/")
  end

end
