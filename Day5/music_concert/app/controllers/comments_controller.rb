class CommentsController < ApplicationController


  def create

    @comment = Comment.new(comment_params)
    @comment.concert_id = params[:concert_id]

    if @comment.save
      flash[:notice] = "Entry created successfully"
    else
      flash[:alert] = "Error. The entry hasn't benn created."
    end

    redirect_to "/concerts/#{params[:concert_id]}/artists/#{params[:id]}"
  end


private


  def comment_params
    params.require(:comment).permit(:concert_id, :comment, :email)
  end


end
