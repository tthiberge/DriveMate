class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    # @rides = Ride.all
    @rides = policy_scope(Ride)
  end

  def dashboard
    @user = current_user

    # /!\ Il y a des users/drivers et des users/owners
    # On n'y accède pas de la même façon

    # Pour les users/drivers, ils sont connectés directement à bookings
    # if current_user
      @driver_bookings = current_user.bookings
    # end

    # Pour les users/owners, il faut passer par ride, puis par bookings
    # Nécessaire de faire des itérations car à chaque étape on récupère une collection (de rides puis de bookings)
    # Ou @owner_bookings = current_user.owner_bookings (owner_bookings définis dans User)
    @owner_bookings = []
    # if current_user
      current_user.rides.each do |ride|
        ride.bookings.each do |booking|
          @owner_bookings << booking
        end
        return @bookings_owner
      end
    # end
  end
end
