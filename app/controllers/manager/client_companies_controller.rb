class Manager::ClientCompaniesController < ApplicationController
  before_action :no_authority

  def index
    @client_companies = ClientCompany.all
    @client_company = ClientCompany.new
  end

  def create
    @client_company = ClientCompany.new(client_company_params)
    @client_company.save
    redirect_to manager_client_companies_path
  end

  def edit
    @client_company = ClientCompany.find(params[:id])
  end

  def update
    @client_company = ClientCompany.find(params[:id])
    @client_company.update(client_company_params)
    redirect_to manager_client_companies_path
  end

  private
  def client_company_params
    params.require(:client_company).permit(:name)
  end

  def no_authority
   @employee = current_employee
   if @employee.role != 99
     redirect_to root_path, notice: "管理者ページのアクセス権限がありません。"
   end
  end


end
