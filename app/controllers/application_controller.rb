class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :first_name, :last_name, :is_admin])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :first_name, :last_name, :is_admin])
  end
end
