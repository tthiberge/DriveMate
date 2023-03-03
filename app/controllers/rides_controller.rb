class RidesController < ApplicationController
  skip_before_action :authenticate_user!, only: :show

  def index
    @rides = policy_scope(Ride)
    # The `geocoded` scope filters only rides with coordinates
    @markers = @rides.geocoded.map do |ride|
      {
        lat: ride.latitude,
        lng: ride.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {ride: ride})
      }
    end
  end

  def show
    @ride = Ride.find(params[:id])
    @booking = Booking.new
    @markers = [
      {
        lat: @ride.latitude,
        lng: @ride.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {ride: @ride})
      },
      {
        lat: @ride.arrival_latitude,
        lng: @ride.arrival_longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {ride: @ride})
      }
    ]
    authorize @ride
    # Je ne comprends pas très bien pourquoi ça marche quand même sans ajouter authorize @booking
    # car on est dans le rides_controller donc ici on n'a besoin d'autoriser que des instances de ride
  end

  def new
    @ride = Ride.new
    # Quand même besoin de l'autoriser en variable d'instance,
    # même si dans ride_policy je ne mets rien car ira voir create?
    authorize @ride
  end

  def create
    @ride = Ride.new(ride_params) # to authorize for security

    # Pundit:
    authorize @ride


    @ride.user = current_user

    if @ride.save
      redirect_to ride_path(@ride)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @ride = Ride.find(params[:id])
    authorize @ride
  end

  def update
    @ride = Ride.find(params[:id])
    authorize @ride

    if @ride.update(ride_params)
      redirect_to ride_path(@ride)
    else
      render :edit, status: :unprocessable_entity
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
    params.require(:ride).permit(:car_type, :owner_presence, :seats_available,
       :description, :date, :departure_location, :arrival_location)
  end
end
