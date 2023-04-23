class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title,null: false 
      t.string :url
      t.string :content
      t.bigint :sub_id, null:false 
      t.bigint :author_id, null:false 

      t.timestamps
    end
  end
end
