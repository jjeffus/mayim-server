class CreateConversations < ActiveRecord::Migration[6.0]
  def change
    create_table :conversations do |t|
      t.string :name
      t.integer :user1_id
      t.integer :user2_id

      t.timestamps
    end
    add_index :conversations, :name
    add_index :conversations, :user1_id
    add_index :conversations, :user2_id
  end
end
