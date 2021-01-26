class ApplicationController < ActionController::Base

  # before_action :set_current_user
  #   @current_user=User.find_by(id: session[:user_id])
  # end

  # before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :profile, :occupation, :position])
  end




end
