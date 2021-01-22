class CommentsController < ApplicationController

  def create
    comment = Comment.new(comment_params)

    if comment.save
      redirect_to prototype_path(comment.prototype.id)
    else
      render :create
    end
  end

  def show
    @comment = Comment.find(params[:id])
  end


  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    if comment.destroy
      redirect_to prototype_path(comment.prototype.id)
      else
        
    end
  end
  


  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
  end

end
