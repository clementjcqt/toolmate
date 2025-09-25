class AddFieldsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :bio, :text
    add_column :users, :location, :string
    add_column :users, :name, :string
    add_column :users, :latitude, :decimal
    add_column :users, :longitude, :decimal
    add_index :users, [:latitude, :longitude]
  end
end
