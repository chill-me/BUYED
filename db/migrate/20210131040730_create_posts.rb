class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.integer :post_id
      t.string :content
      t.string :post_image

      t.timestamps
    end
  end
end
