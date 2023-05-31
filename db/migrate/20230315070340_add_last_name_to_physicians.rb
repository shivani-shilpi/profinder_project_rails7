class AddLastNameToPhysicians < ActiveRecord::Migration[7.0]
  def change
    add_column :physicians, :last_name, :string
  end
end
