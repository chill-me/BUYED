class RenameImageNameToPosts < ActiveRecord::Migration[5.2]
  def change

    add_column :posts, :post_imgname, :string 

    remove_column :posts, :post_image, :string 



  end
end
