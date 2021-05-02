class Member::ClientCommentsController < ApplicationController

  def create
    @client = Client.find(params[:client_id])
    @comment = current_employee.client_comments.new(client_comment_params)
    @comment.client_id = @client.id
    if @comment.save
      redirect_to member_client_path(@client), notice: "コメントを投稿しました。"
    else
      render "clients/show"
    end

  end

  def destroy
    @client = Client.find(params[:client_id])
    @client_comment = ClientComment.find(params[:id])
    @cliemt_comment.destroy
    redirect_to member_client_path(params[:client_id]), notice: "コメントを削除しました。"
  end

  private
  def client_comment_params
    params.require(:client_comment).permit(:comment)
  end
end
