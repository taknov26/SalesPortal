class Member::MattersController < ApplicationController
  before_action :premise, only:[:new, :create, :edit, :update, :index]
  require 'csv'

  def new
    @matter = Matter.new
  end

  def create
    @matter = current_employee.matters.new(matter_params)
    @employee = current_employee
    if @matter.save
      redirect_to member_matter_path(@matter), notice: "登録完了"
    else
      render "new"
    end
  end

  def edit
    @matter = Matter.find(params[:id])
  end

  def update
    @matter = Matter.find(params[:id])
    if @matter.update(matter_params)
      redirect_to member_matter_path(@matter), notice: "更新しました"
    else
      render "edit"
    end
  end

  def show
    @matter = Matter.find(params[:id])
    @cost = @matter.costs.build
    @costs = Cost.where(matter_id: params[:id])
    @matter_comment = MatterComment.new
    @matter_comments = @matter.matter_comments.order("created_at DESC")
  end

  def index
    @matters = Matter.all
    respond_to do |format|
      format.html
      format.json
      format.csv do
        matters_csv(@matters)
      end
    end
  end

  private

  def premise
    @client_companies = ClientCompany.all
    @clients = Client.all
    @client_people = ClientPerson.all
  end

  def matter_params
    params.require(:matter).permit(:employee_id, :client_company_id, :client_id, :client_person_id, :name, :price, :status, :fixed_date)
  end

  def matters_csv(matters)
    csv_data = CSV.generate(encoding: Encoding::SJIS, row_sep: "\r\n", force_quotes: true) do |csv|
      csv << ["案件一覧"]
      csv << []
      column_names = %w(案件名 社内担当 クライアント会社名 クライアント クライアント担当 売上 売上確定日 ステータス)
      csv << column_names
      @matters.each do|matter|
      column_values = [
        matter.name,
        matter.employee.name,
        matter.client_company.name,
        matter.client.branch_name,
        matter.client_person.name,
        matter.price,
        matter.fixed_date,
        matter.status,
        ]
        csv << column_values
      end
    end
    send_data(csv_data, filename: "案件一覧.csv")
  end
end
