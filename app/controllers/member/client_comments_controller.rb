class Member::ClientCommentsController < ApplicationController

  def create
    @client = Client.find(params[:client_id])
    @client_comment = current_employee.client_comments.new(client_comment_params)
    @client_comment.client_id = @client.id
    if @client_comment.save
      render :index
    else
      render "clients/show"
    end

  end

  def destroy
    @client = Client.find(params[:client_id])
    @client_comment = ClientComment.find(params[:id])
    @client_comment.destroy
    render :index
  end

  private
  def client_comment_params
    params.require(:client_comment).permit(:comment)
  end
end
