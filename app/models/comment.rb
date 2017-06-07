class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :product
  validates :user_id, presense: true
  validates :content, presense: true
end
