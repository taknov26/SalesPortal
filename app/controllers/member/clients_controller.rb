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
    if client.save
      redirect_to member_client_path(client)
      flash[:notice] = "保存しました。"
    else
      render "new"
    end
  end

  def show
    @client = Client.find(params[:id])
  end

  def edit
    @client = Client.find(params[:id])
    @client_companies = ClientCompany.all
  end

  def update
    @client = Client.find(params[:id])
    @client.update(client_params)
    redirect_to member_client_path(@client)
  end

  private
  def client_params
    params.require(:client).permit(:client_company_id, :branch_name, :address, :telephone_number)
  end
end
