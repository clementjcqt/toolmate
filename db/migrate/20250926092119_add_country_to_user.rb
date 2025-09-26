class AddCountryToUser < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :country, :string, :default =>"France"
  end
end
