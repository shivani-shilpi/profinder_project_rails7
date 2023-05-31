class CreateNotes < ActiveRecord::Migration[7.0]
  def change
    create_table :notes do |t|
      t.string :title
      t.text :body
      t.string :notable_type
      t.bigint :notable_id

      t.timestamps
    end
  end
end
