class AddColumnUseremailToBlogs < ActiveRecord::Migration[5.1]
  def change
    add_column :blogs, :user_email, :string
  end
end
