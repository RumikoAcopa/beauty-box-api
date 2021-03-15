class AddProductsToInventories < ActiveRecord::Migration[6.0]
  def change
    add_reference :inventories, :products, null: false, foreign_key: true
  end
end
