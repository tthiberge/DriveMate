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

    departure_location_address(departure_results)
    self.departure_results = departure_results.data
    
    arrival_results = Geocoder.search(arrival_location).first
    self.arrival_latitude = arrival_results.data["lat"]
    self.arrival_longitude = arrival_results.data["lon"]
    arrival_location_address(arrival_results)

    self.arrival_results = arrival_results.data
  end

  def arrival_location_address(arrival_results)
    if arrival_results.data.dig("address","city")
      self.arrival_location = arrival_results.data.dig("address", "city")
    elsif arrival_results.data.dig("address","town")
      self.arrival_location = arrival_results.data.dig("address", "town")
    elsif arrival_results.data.dig("address", "suburb")
      self.arrival_location = arrival_results.data.dig("address", "suburb")
    else
      self.arrival_location = arrival_results.data.dig("address", "place")
    end
  end

  def departure_location_address(departure_results)
    if departure_results.data.dig("address","city")
      self.departure_location = departure_results.data.dig("address", "city")
    elsif departure_results.data.dig("address","town")
      self.departure_location = departure_results.data.dig("address", "town")
    elsif departure_results.data.dig("address", "suburb")
      self.departure_location = departure_results.data.dig("address", "suburb")
    else
      self.departure_location = departure_results.data.dig("address", "place")
    end
  end
end
