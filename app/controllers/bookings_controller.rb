class BookingsController < ApplicationController
  def create
    @ride = Ride.find(params[:ride_id])
    @booking = Booking.new(booking_params)

    # Pundit
    # authorize @ride - pas nécessaire car on l'amende pas vraiment
    authorize @booking

    @booking.ride = @ride
    @booking.user = current_user

     if @booking.save
      redirect_to dashboard_path
    else
      # flash.alert("Au moins 10 caractères")
      redirect_to ride_path(@ride)
      # Faire la show et vérifier si ça marche
      # Sinon je ne peux pas le vérifier sans formulaire
      # Nadia voulait me faire tester
      # /!\ ça ne pourra pas marcher sans formulaire
    end
  end

  def edit
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def update
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def destroy
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def update_status
    @booking = Booking.find(params[:booking_id])
    authorize @booking
    @booking.status = params[:status]
    @booking.save
    if params[:status] == "Confirmed"
      @booking.ride.bookings.excluding(@booking).each do |declined_booking|
        declined_booking.status = "Declined"
        declined_booking.save
      end
    end
    redirect_to dashboard_path
  end

  # def status_to_confirmed
  #   booking_confirmed = Booking.find(params[:id])
  #   authorize booking_confirmed
  #   booking_confirmed.status = "Confirmed"

  #   # booking.ride.bookings.excluding(booking).each do |booking_declined|
  #   #   booking_declined.status = "Declined"
  #   # end
  # end

  # def status_to_declined
  #   booking_declined = Booking.find(params[:id])
  #   authorize booking_declined
  #   booking_declined.status = "Declined"
  # end



  private

  def booking_params
    params.require(:booking).permit(:comment, :status)
  end
end
