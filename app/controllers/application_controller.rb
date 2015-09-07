class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_filter :authenticate_user!

  def after_sign_in_path_for(resource)
    if resource.steps_passed?
      new_appointment_path
    else
      user_steps_path
    end
  end

  def configure_permitted_parameters
  	devise_parameter_sanitizer.for(:sign_up) << [:name, :age, :height]
  end
end
