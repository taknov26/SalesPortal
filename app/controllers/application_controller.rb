class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  # def after_sign_in_path_for(resource)
  #   if employee_signed_in?
  #     root_path
  #   else
  #     new_employee_sessio_path
  #   end
  # end
  # ログイン後の画面遷移設定

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
    keys: [:name, :name_kana, :telephone_number, :belonging, :position, :phone_extension])
  end
end
