class Manager::HomesController < ApplicationController
  before_action :no_authority

  def top
  end

 private
 def no_authority
   @employee = current_employee
   if @employee.role != 99
     redirect_to root_path, notice: "管理者ページのアクセス権限がありません。"
   end
 end

end
