class CreateMailers < ActiveRecord::Migration[7.0]
  def change
    create_table :mailers do |t|
      t.text :to
      t.string :subject
      t.text :body

      t.timestamps
    end
  end
end
