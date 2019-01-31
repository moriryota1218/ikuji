class CommentsController < ApplicationController



  def new
    @comment = Comment.new
  end


  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_back(fallback_location: topics_path)
    else
      redirect_back(fallback_location: topics_path)
    end
  end

  def destroy
    @comment = Comment.find_by(id: params[:id]).destroy
    redirect_to("/topics/")
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :user_id, :topic_id)
  end
end
