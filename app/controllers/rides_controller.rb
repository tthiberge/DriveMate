class RidesController < ApplicationController
  skip_before_action :authenticate_user!, only: :show

  def show
    @ride = Ride.find(params[:id])
    @booking = Booking.new
  end

  def new

  end

  def create

  end
end
