class AddBlogToContent < ActiveRecord::Migration[7.1]
  def change
    add_column :contents, :blog, :text
  end
end
