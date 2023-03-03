class Ride < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy

  geocoded_by :departure_location
  after_validation :geocode, if: :will_save_change_to_departure_location?

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

  private

  def geocode

    departure_results = Geocoder.search(departure_location).first
    self.latitude = departure_results.data["lat"]
    self.longitude = departure_results.data["lon"]
    self.departure_location = departure_results.data.dig("address","city")
    self.departure_results = departure_results.data
    arrival_results = Geocoder.search(arrival_location).first
    self.arrival_latitude = arrival_results.data["lat"]
    self.arrival_longitude = arrival_results.data["lon"]
    self.arrival_location = arrival_results.data.dig("address","city")
    self.arrival_results = arrival_results.data
  end
end
