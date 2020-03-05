class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[facebook]
  has_many :posts, dependent: :destroy
  has_many :comments
  has_many :likes
  has_many :friendships
  has_many :accepted_friendships,-> { where status: 'accepted' }, class_name: "Friendship"
  has_many :requested_friendships,-> { where status: 'requested' }, class_name: "Friendship"
  has_many :pending_friendships,-> { where status: 'pending' }, class_name: "Friendship"
  has_many :friends, through: :accepted_friendships
  has_many :requested_friends, through: :requested_friendships, source: :friend
  has_many :pending_friends, through: :pending_friendships, source: :friend
  
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.name = auth.info.name # assuming the user model has a name
      user.image = auth.info.image # assuming the user model has an image
      # If you are using conferable and the provider(s) you use validate emails,
      # uncomment the line below to skip the confirmation emails.
      # user.skip_confirmation!
    end
  end
end
