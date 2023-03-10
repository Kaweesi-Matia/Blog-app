class ApplicationController < ActionController::Base
  before_action :update_allowed_parameters, if: :devise_controller?

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:Name, :Bio, :photo, :email, :password, :confirm_password)
    end
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:Name, :email, :password, :current_password) }
  end
end
