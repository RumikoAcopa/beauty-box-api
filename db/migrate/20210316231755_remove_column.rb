class RemoveColumn < ActiveRecord::Migration[6.0]
  def change
    rename_column :products, :type, :details
  end
end
