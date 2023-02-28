class BookingsController < ApplicationController
  def create
    @ride = Ride.find(params[:ride_id])
    @user = User.find(params[:user_id])
    @booking = Booking.new(booking_params)
    @booking.ride = @ride
    @booking.user = @user
    if @booking.save
      redirect_to dashboard_path
    else
      redirect_to ride_path(@ride), status: :unprocessable_entity
      # Faire la show et vérifier si ça marche
      # Sinon je ne peux pas le vérifier sans formulaire
      # Nadia voulait me faire tester
      # /!\ ça ne pourra
    end
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def update
    
  end

  private

  def booking_params
    params.require(:booking).permit(:comment, :status)
  end
end
