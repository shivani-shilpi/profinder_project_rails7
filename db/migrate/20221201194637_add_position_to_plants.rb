class AddPositionToPlants < ActiveRecord::Migration[7.0]
  def change
    add_column :plants, :position, :integer
    Plant.order(:updated_at).each.with_index(1) do |plant, index|
      plant.update_column :position, index
    end
  end
end
