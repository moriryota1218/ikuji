class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all.order(created_at: "desc")
    @recipe = Recipe.new


  end


  def new
    @recipes = Recipe.new
  end

  def show
    @likes_count = Like.where(recipe_id: @recipe.id).count
  end

  def create
    @recipes = current_user.recipes.new(recipe_params)

    if @recipes.save
      redirect_to recipes_path, success: 'レシピを投稿しました'
    else
      flash.now[:danger] = "レシピ投稿に失敗しました"
      render :new
    end
  end

  def destroy
    @recipes = Recipe.find_by(id: params[:id])
    @recipes.destroy
    redirect_to recipes_path
  end

  private
  def recipe_params
    params.require(:recipe).permit(:title, :category, :image, :how_to_make, :cooking_material,
     :user_id, :recipe_id)
  end

end
