class CommentsController < ApplicationController
  
  def new
    @comment = Comment.new
  end


  def create
      @comment = current_user.comments.new(comment_params)

    if @comment.save
      redirect_back(fallback_location: topics_path)
    else
      redirect_back(fallback_location: topics_path)
    end

end

private
def comment_params
  params.require(:comment).permit(:content, :user_id, :topic_id)
end
