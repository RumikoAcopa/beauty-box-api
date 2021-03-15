class RemoveColumn < ActiveRecord::Migration[6.0]
  def change
    remove_column :inventories, :category_id
  end
end
