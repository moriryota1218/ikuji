class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.integer :user_id
      t.string :image
      t.string :title
      t.string :category
      t.string :cooking_material
      t.string :how_to_make

      t.timestamps
    end
  end
end
