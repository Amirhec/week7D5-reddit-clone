class Update < ActiveRecord::Migration[7.0]
  def change
    add_index :subs,:user_id
    add_index :users, :username 
    add_index :users, :session_token
    add_index :posts, :sub_id
    add_index :posts, :author_id

    add_foreign_key :subs, :users, column: :user_id
    add_foreign_key :posts, :subs, column: :sub_id 
    add_foreign_key :posts, :users, column: :author_id

  end
end
