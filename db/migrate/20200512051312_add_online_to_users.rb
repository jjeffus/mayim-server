class AddOnlineToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :online, :boolean
    add_index :users, :online
  end
end
