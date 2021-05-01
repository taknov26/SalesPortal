class Member::MatterCommentsController < ApplicationController

  def create
    @matter = Matter.find(params[:matter_id])
    @comment = current_employee.matter_comments.new(matter_comment_params)
    @comment.matter_id = @matter.id
    if @comment.save
      redirect_to member_matter_path(@matter), notice: "コメントを投稿しました。"
    else
      render "matters/show"
    end

  end

  def destroy
    @matter = Matter.find(params[:matter_id])
    @matter_comment = MatterComment.find(params[:id])
    @matter_comment.destroy
    redirect_to member_matter_path(params[:matter_id]), notice: "コメントを削除しました。"
  end

  private
  def matter_comment_params
    params.require(:matter_comment).permit(:comment)
  end


end
