class Member::CostsController < ApplicationController

  def create
    @matter = Matter.find(params[:matter_id])
    @cost = @matter.costs.build(cost_params)
    if @cost.save
      redirect_to member_matter_path(@cost.matter), notice: "原価を1件登録しました。"
    else
      redirect_to member_matter_path(@cost.matter), notice: "原価の入力に誤りがあります。"
    end
  end

  def destroy
    @matter = Matter.find(params[:matter_id])
    @cost = Cost.find(params[:id])
    @cost.destroy
    redirect_to member_matter_path(params[:matter_id]), notice: "原価を1件削除しました。"
  end

  private

  def cost_params
    params.require(:cost).permit(:item, :item_price)
  end

end
