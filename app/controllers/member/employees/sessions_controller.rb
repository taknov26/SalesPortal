# frozen_string_literal: true

class Member::Employees::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  before_action :reject_inactive_employee, only: [:create]

  def guest_sign_in
    employee = Employee.guest
    sign_in employee
    redirect_to root_path, notice: "ゲストユーザーしてログインしました。"
  end
  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
  def reject_inactive_employee
    @employee = Employee.find_by(email: params[:employee][:email])
    if @employee
      if @employee.valid_password?(params[:employee][:password]) && !@employee.is_active
        redirect_to new_employee_session_path, notice: "退職済みです"
      end
    end
  end

end
