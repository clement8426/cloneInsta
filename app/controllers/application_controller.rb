class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!



  protected


  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :phone_number, :full_name ])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :phone_number, :full_name, :profile_picture, :bio, :private])

  end

  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end
end
