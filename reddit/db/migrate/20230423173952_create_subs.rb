class CreateSubs < ActiveRecord::Migration[7.0]
  def change
    create_table :subs do |t|
      t.string :title
      t.string :description
      t.bigint :user_id

      t.timestamps
    end
  end
end
