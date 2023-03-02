class Ride < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy

  #include PgSearch::Model
  #pg_search_scope :search_by_departure_location_and_arrival_location,
 # against: [ :departure_location, :arrival_location ],
  #using: {
 #   tsearch: { prefix: true } # <-- now `superman batm` will return something!
#  }
#end

#Ride.search_by_departure_location_and_arrival_location("Paris")

  include PgSearch::Model
  pg_search_scope :search_full_text,
  against: {
    departure_location: "A",
    arrival_location:  'A',
    description: 'B'
  }
end
