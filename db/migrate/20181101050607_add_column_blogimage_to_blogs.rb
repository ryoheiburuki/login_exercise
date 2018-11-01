class AddColumnBlogimageToBlogs < ActiveRecord::Migration[5.1]
  def change
    add_column :blogs, :blog_image_url, :text
  end
end
