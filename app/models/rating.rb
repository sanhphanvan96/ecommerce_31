class Rating < ApplicationRecord
  belongs_to :product
  validates :user_id, presense: true
end
