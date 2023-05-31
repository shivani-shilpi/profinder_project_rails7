class AddPositionToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :position, :integer
    User.order(:updated_at).each.with_index(1) do |user, index|
      user.update_column :position, index
    end
  end
end
