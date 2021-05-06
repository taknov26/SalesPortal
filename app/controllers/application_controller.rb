class ApplicationController < ActionController::Base
  before_action :authenticate_employee!,except: [:sign_in, :sign_up]
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    if employee_signed_in?
      root_path
    end
  end

  def after_sign_out_path_for(resource)
      new_employee_session_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :name, :name_kana, :telephone_number, :belonging, :position, :phone_extension])
  end
end
