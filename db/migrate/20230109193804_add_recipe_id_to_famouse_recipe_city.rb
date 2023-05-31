class AddRecipeIdToFamouseRecipeCity < ActiveRecord::Migration[7.0]
  def change
    add_column :famouse_recipe_cities, :recipe_id, :integer
  end
end
