class User < ApplicationRecord
  has_many :purrs
  has_one_attached :avatar
  
  has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy

  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower


  validates :username, length: {maximum: 15}, presence: true,
            format: {with: /[a-z0-9_]{1,15}/, message: "can only contain letters, numbers and '_'"}

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def follow(other)
    active_relationships.create!(followed_id: other.id)
  end

  def unfollow(other)
    active_relationships.find_by(followed_id: other.id).destroy
  end

  def followed?(other)
    following.include?(other)
  end
end
