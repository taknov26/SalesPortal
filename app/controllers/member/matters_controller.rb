class Member::MattersController < ApplicationController

  def new
    @matter = Matter.new
  end

  def create
    @matter = Matter.new(matter_params)
    if @matter.save
      redirect_to member_matter_path(@matter), notice: "登録完了"
    else
      render "new", alert: "登録失敗"
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
      render "edit", alert: "更新失敗"
    end
  end

  def show
    @matter = Matter.find(params[:id])
  end

  def index
    @matters = Matter.all
  end

  private matter_params
  params.require(:matter).permit(:employee_id, :client_company_id, :client_id, :client_person_id, :name, :price, :status, :fixed_date)

end
