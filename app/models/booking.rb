class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :ride

  validates :comment, length: { minimum: 10 }
end
