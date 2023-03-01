class RidesController < ApplicationController
  skip_before_action :authenticate_user!, only: :show

  def show
    @ride = Ride.find(params[:id])
    @booking = Booking.new
    authorize @ride
    # Je ne comprends pas très bien pourquoi ça marche quand même sans ajouter authorize @booking

  end

  def new
    @ride = Ride.new
    # Quand même besoin de l'autoriser en variable d'instance,
    # même si dans ride_policy je ne mets rien car ira voir create?
    authorize @ride
  end

  def create
    @ride = Ride.new(ride_params) # to authorizse for security

    # Pundit:
    authorize @ride


    @ride.user = current_user

    if @ride.save
      redirect_to ride_path(@ride)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @ride = Ride.find(params[:id])
    authorize @ride
    @ride.destroy
    redirect_to root_path, notice: "Ride successfully deleted.", status: :see_other
  end

  private

  def ride_params
    params.require(:ride).permit(:car_type, :owner_presence,:seats_available,
       :description, :date, :departure_location, :arrival_location)
  end
end
