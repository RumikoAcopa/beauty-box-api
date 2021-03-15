class ChangeProductsToInventories < ActiveRecord::Migration[6.0]
  def change
    rename_table :products, :inventories do |t|
    
      t.string :name
      t.integer :quantity
      t.string :type
      t.references :user, null: false, foreign_key: true
      t.references :products, null: false, foreign_key: true

      t.timestamps
    end
  end
end
