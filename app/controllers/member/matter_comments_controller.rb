class Member::MatterCommentsController < ApplicationController

  def create
    @matter = Matter.find(params[:matter_id])
    @matter_comment = current_employee.matter_comments.new(matter_comment_params)
    @matter_comment.matter_id = @matter.id
    if @matter_comment.save
      render :index
    else
      render "matters/show"
    end

  end

  def destroy
    @matter = Matter.find(params[:matter_id])
    @matter_comment = MatterComment.find(params[:id])
    @matter_comment.destroy
    render :index
  end

  private
  def matter_comment_params
    params.require(:matter_comment).permit(:comment)
  end


end
