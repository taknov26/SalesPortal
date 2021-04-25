class Member::EmployeesController < ApplicationController

  def show
  end

  def index
    @employees = Employee.all
  end

  def edit
  end

  def update
  end

end
