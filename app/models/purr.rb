class Purr < ApplicationRecord
  belongs_to :user
  validates_associated :user

  has_many :likes, class_name: "Like", foreign_key: "liked_id", dependent: :destroy
  has_many :likers, through: likes, source: :liker
  
  validates :content, length: {maximum: 140}, presence: true
end
