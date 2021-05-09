class Member::EmployeesController < ApplicationController
  before_action :ensure_current_employee, {only: [:edit, :update]}

  def show
    @employee = Employee.find(params[:id])
    @matters = Matter.where(employee_id: params[:id])
  end

  def index
    @employees = Employee.all
  end

  def edit
    @employee = Employee.find(params[:id])
  end

  def update
    @employee = Employee.find(params[:id])
    @employee.update(employee_params)
    redirect_to member_employee_path(@employee)
  end

  private

  def ensure_current_employee
    @employee = Employee.find(params[:id])
    if current_employee.id != params[:id].to_i
      redirect_to member_employee_path(@employee), notice: "アクセス権限がありません"
    end
  end

  def employee_params
    params.require(:employee).permit(:image, :name, :name_kana, :belonging, :position, :phone_extention)
  end

end
