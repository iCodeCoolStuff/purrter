class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.integer :purr_id
      t.integer :user_id
      t.timestamps
    end

    add_index :likes, :purr_id
    add_index :likes, :user_id
  end
end
