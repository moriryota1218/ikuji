class NewTopicsController < ApplicationController

  before_action :login_check, only: [:comments :create, :destroy]

  def login_check
   unless user_signed_in?
     flash[:alert] = "新規登録してください"
     redirect_to "/signup"
   end
  end

  def index
    @topics = Topic.order(created_at: "desc").limit(3)
    @topic = Topic.new

  end

  def new
    @topic = Topic.new
  end

end
