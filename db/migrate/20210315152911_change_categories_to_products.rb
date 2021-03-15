class ChangeCategoriesToProducts < ActiveRecord::Migration[6.0]
  def change
    rename_table :categories, :products do |t|
      
      t.string :name
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
