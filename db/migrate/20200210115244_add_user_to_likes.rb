class AddUserToLikes < ActiveRecord::Migration[6.0]
  def change
    add_reference :likes, :user, foreign_key: true
  end
end
