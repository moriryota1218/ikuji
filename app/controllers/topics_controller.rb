class TopicsController < ApplicationController
  before_action :authenticate_user!, only: [:show, :create]

  def index
    @topics = Topic.all.order(created_at: "desc")
    @topic = Topic.new

  end

  def new
    @topic = Topic.new
  end

  def show
    @topic = Topic.find(params[:id])
    @comments = @post.comments
    @comment = Comment.new
  end

  def create
    @topic = current_user.topics.new(topic_params)


    if @topic.save
      redirect_to topics_path, success: '投稿しました'
    else
      flash.now[:danger] = "投稿に失敗しました"
      render :new
    end
  end

  def destroy
    @topic = Topic.find_by(id: params[:id])
    @topic.destroy
    redirect_to topics_path
  end

  private
  def topic_params
    params.require(:topic).permit(:title, :category, :description, :image)
  end
end
