class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :url
      t.string :content
      t.bigint :sub_id
      t.bigint :author_id

      t.timestamps
    end
  end
end
