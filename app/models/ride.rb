class Ride < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy

  geocoded_by :departure_location
  after_validation :geocode, if: :will_save_change_to_departure_location?
end
