class CreateAddColumnRecipes < ActiveRecord::Migration[5.2]
  def change
    change_column :recipes, :cooking_material, :text
    change_column :recipes, :how_to_make, :text
  end
end
