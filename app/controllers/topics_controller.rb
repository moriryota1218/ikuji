class TopicsController < ApplicationController

    before_action :authenticate_user!, only: [:index, :new, :create, :destroy]


  def index
   @topics = Topic.all.order(created_at: "desc")
   @topic = Topic.new
  end

  def new
    @topic = Topic.new
  end

  def newTopics
    @topics = Topic.order(created_at: "desc").limit(3)

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
    params.require(:topic).permit(:title, :category, :description, :image, :content,
    :user_id, :topic_id)
  end
end
