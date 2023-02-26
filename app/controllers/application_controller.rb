class ApplicationController < ActionController::Base
  before_action :authenticate_user!,:configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :description, :car_owner, :gearbox, :car_owner_info, :driving_licence, :driving_licence_info])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :description, :car_owner, :gearbox, :car_owner_info, :driving_licence, :driving_licence_info])
  end
end
