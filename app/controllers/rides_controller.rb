class RidesController < ApplicationController
  skip_before_action :authenticate_user!, only: :show

  def show
    @ride = Ride.find(params[:id])
    @booking = Booking.new
  end

  def new
    @ride = Ride.new
  end

  def create
    @ride = Ride.new(ride_params) # to authorizse for security
    @ride.user = current_user

    if @ride.save
      redirect_to ride_path(@ride)
    else
      render :new
    end
  end

  def destroy
    @ride = Ride.find(params[:id])

    @ride.destroy
    redirect_to root_path, notice: "Ride successfully deleted.", status: :see_other
  end

  private

  def ride_params
    params.require(:ride).permit(:car_type, :owner_presence, :seats_available, :description, :date)
  end
end
