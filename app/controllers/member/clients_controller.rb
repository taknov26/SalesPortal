class Member::ClientsController < ApplicationController

  def new
    @client = Client.new
    @client_companies = ClientCompany.all
  end

  def index
    @clients = Client.all
  end

  def create
    client = Client.new(client_params)
    client.save
    redirect_to member_client_path(client)
  end

  def show
  end

  def edit
  end

  def update
  end

  private
  def client_params
    params.require(:client).permit(:client_company_id, :branch_name, :address, :telephone_number)
  end
end
