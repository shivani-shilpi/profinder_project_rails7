class CreatePationts < ActiveRecord::Migration[7.0]
  def change
    create_table :pationts do |t|
      t.string :name

      t.timestamps
    end
  end
end
