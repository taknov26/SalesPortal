class Manager::EmployeesController < ApplicationController

  def index
    @employees = Employee.all
  end

  def update
    @employee = Employee.find(params[:id])
    if @employee.update(employee_params)
      redirect_to manager_employees_path, notice: "社員情報を更新しました。"
    else
      render "index"
    end
  end

  private
  def employee_params
    params.require(:employee).permit(:is_active, :role)
  end

end
