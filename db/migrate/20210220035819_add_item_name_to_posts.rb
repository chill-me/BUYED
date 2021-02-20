class AddItemNameToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :item_name, :string
    add_column :posts, :satisfaction, :integer
    add_column :posts, :price, :integer


  end
end
