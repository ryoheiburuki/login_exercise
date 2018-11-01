class AddColumnUserimageToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :user_image_url, :text
  end
end
