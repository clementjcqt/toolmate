class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_out_path_for(_resource_or_scope)
    home_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:bio, :location, :avatar])
    devise_parameter_sanitizer.permit(:account_update, keys: [:bio, :location, :avatar])
  end
end
