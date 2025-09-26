class AddAddressToUser < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :street, :string
    add_column :users, :city, :string
    add_column :users, :post_code, :integer
    remove_column :users, :location
  end
end
