class RemoveColumnUseremailFromBlogs < ActiveRecord::Migration[5.1]
  def change
      remove_column :blogs, :user_email
  end
end
