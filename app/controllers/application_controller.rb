# app/controllers/application_controller.rb

class ApplicationController < ActionController::API
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name last_name email password password_confirmation])
    devise_parameter_sanitizer.permit(:account_update,
                                      keys: %i[name last_name email password password_confirmation])
  end
end
