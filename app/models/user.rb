class User < ApplicationRecord
  has_many :purrs
  has_one_attached :avatar
  validates :username, length: {maximum: 15}, presence: true,
            format: {with: /[a-z0-9_]{1,15}/, message: "can only contain letters, numbers and '_'"}

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
