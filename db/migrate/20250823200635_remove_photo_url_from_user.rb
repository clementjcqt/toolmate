class RemovePhotoUrlFromUser < ActiveRecord::Migration[7.1]
  def change
    remove_column :users, :photo_url
  end
end
