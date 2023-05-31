class CreateFamouseRecipeCities < ActiveRecord::Migration[7.0]
  def change
    create_table :famouse_recipe_cities do |t|
      t.string :place
      t.string :city

      t.timestamps
    end
  end
end
