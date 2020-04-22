class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User'
  validates :friend_id, presence: true
  def self.accept(user, friend)
    transaction do
      updated_at = Time.now
      accept_one_side(user, friend, updated_at)
      accept_one_side(friend, user, updated_at)
    end
  end



  def self.breakup(user, friend)
    transaction do
      find_by_user_id_and_friend_id(user, friend).destroy
      find_by_user_id_and_friend_id(friend, user).destroy
    end
  end

  def self.accept_one_side(user, friend, updated_at)
    request = self.where(user_id: user,friend_id: friend)
    request.update(status:'accepted')
    request.update(updated_at:updated_at)
    
  end
end
