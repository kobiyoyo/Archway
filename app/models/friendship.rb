class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User'

  def self.accept(user, friend)
    transaction do
      updated_at = Time.now
      accept_one_side(user, friend, updated_at)
      accept_one_side(friend, user, updated_at)
    end
  end

  def self.request(user, friend)
    if user != friend
      transaction do
        create(user: user, friend: friend, status: 'pending')
        create(user: friend, friend: user, status: 'requested')
      end
    end
  end

  def self.breakup(user, friend)
    transaction do
      find_by_user_id_and_friend_id(user, friend).destroy
      find_by_user_id_and_friend_id(friend, user).destroy
    end
  end

  private

  def self.accept_one_side(user, friend, updated_at)
    request = find_by_user_id_and_friend_id(user, friend)
    request.status = 'accepted'
    request.updated_at = updated_at
    request.save!
  end
end
