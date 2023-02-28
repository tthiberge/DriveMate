class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @rides = Ride.all
  end

  def dashboard
    @user = current_user
    # /!\
    @driver_bookings = current_user.bookings

    # A reprendre MERCREDI
    # Ou @owner_bookings = current_user.owner_bookings (owner_bookings définis dans User)
    @bookings_owner = []
    current_user.rides.each do |ride|
      ride.bookings.each do |booking|
        @bookings_owner << booking
      end
    end
  end
end
