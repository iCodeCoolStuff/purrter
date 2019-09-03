class User < ApplicationRecord
  has_many :purrs, dependent: :destroy
  has_one_attached :avatar, dependent: :destroy
  
  has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy

  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  has_many :likes, class_name: "Like", foreign_key: "liker_id", dependent: :destroy
  has_many :liked_posts, through: :purrs, source: :likers

  validates :name, length: {maximum: 50}, presence: true
  validates :username, length: {maximum: 15}, presence: true, uniqueness: true,
            format: {with: /[a-z0-9_]{1,15}/i, message: "can only contain letters, numbers and '_'"}

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

  def following?(other)
    following.include?(other)
  end

  def self.random_2_not(user)
    records = User.where.not(id: user.id)

    unless user.following.empty?
      records = records.where("id not in (?)", user.following.pluck(:id))         
    end

    records.order(Arel.sql('random()')).limit(2) 
  end

  def like(post)
    likes.create!(liked_id: post.id)
  end

  def unlike(post)
    likes.find_by(liked_id: post.id).destroy
  end
end
