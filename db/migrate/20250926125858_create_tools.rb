class CreateTools < ActiveRecord::Migration[7.1]
  def change
    create_table :tools do |t|
      t.string :name
      t.integer :category
      t.integer :price
      t.integer :condition
      t.boolean :is_available
      t.text :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
