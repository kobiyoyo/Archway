class CreateFriendships < ActiveRecord::Migration[6.0]
  def change
    create_table :friendshipss do |t|
      t.integer :user
      t.integer :friend_id

      t.timestamps
    end
  end
end
