class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  validates :content, presence: true, length: { maximum: 400 }
  has_one_attached :image
end
