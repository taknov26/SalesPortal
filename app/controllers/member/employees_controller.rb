class Member::EmployeesController < ApplicationController

  def show
    @employee = Employee.find(params[:id])
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

  def employee_params
    params.require(:employee).permit(:image, :name, :name_kana, :belonging, :position, :phone_extention)
  end

end
