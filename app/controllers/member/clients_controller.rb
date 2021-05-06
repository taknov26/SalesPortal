class Member::ClientsController < ApplicationController
  before_action :premise, only:[:new, :create, :edit, :update, :index]
  def new
    @client = Client.new
    @client_companies = ClientCompany.all
  end

  def index
  end

  def create
    @client = Client.new(client_params)
    if @client.save
      redirect_to member_client_path(@client), notice: "保存しました。"
    else
      render "new"
    end
  end

  def show
    @client = Client.find(params[:id])
    @client_person = @client.client_people.build
    @client_people = ClientPerson.where(client_id: params[:id])
    @client_comment = ClientComment.new
    @client_comments = @client.client_comments.order("created_at")
  end

  def edit
    @client = Client.find(params[:id])
    @client_companies = ClientCompany.all
  end

  def update
    @client = Client.find(params[:id])
    if @client.update(client_params)
     redirect_to member_client_path(@client), notice: "更新しました。"
    else
      render "edit"
    end
  end

  private

  def client_params
    params.require(:client).permit(:client_company_id, :branch_name, :address, :telephone_number)
  end

  def premise
    @client_companies = ClientCompany.all
    @clients = Client.all
    @client_people = ClientPerson.all
  end
end
