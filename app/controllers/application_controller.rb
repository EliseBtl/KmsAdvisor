class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  #before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  include CanCan::ControllerAdditions

protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :gender, :image, :provider, :uid])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:name, :email, :gender, :image, :provider, :uid])
  end

end
