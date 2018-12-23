class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all.order(created_at: "desc")
  end


  def new
    @recipes = Recipe.new
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
    binding.pry
    @recipes.destroy
    redirect_to recipes_path
  end

  private
  def recipe_params
    params.require(:recipe).permit(:title, :category, :image, :how_to_make, :cooking_material)
  end

end
