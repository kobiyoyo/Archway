class AddStatusToFriendship < ActiveRecord::Migration[6.0]
  def change
    add_column :friendships, :status, :string
  end
end
