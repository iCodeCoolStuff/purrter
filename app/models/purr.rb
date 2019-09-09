class Purr < ApplicationRecord
  belongs_to :user
  validates_associated :user

  has_many :likes, dependent: :destroy
  
  validates :content, length: {maximum: 140}, presence: true
end
