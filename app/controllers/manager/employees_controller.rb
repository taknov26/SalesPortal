class Manager::EmployeesController < ApplicationController
  def index
    @employees = Employee.all
  end
end
