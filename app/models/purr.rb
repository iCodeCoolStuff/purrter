class Purr < ApplicationRecord
  belongs_to :user
  validates_associated :user
  
  validates :content, length: {maximum: 50}
end
