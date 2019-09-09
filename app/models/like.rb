class Like < ApplicationRecord
  belongs_to :user
  belongs_to :purr
  validates :user_id, presence: true
  validates :purr_id, presence: true
end