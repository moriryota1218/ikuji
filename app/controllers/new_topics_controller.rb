class NewTopicsController < ApplicationController
  def index
    @new_topics = Topic.order(created_at: "desc").limit(3)
    @new_topic = Topic.new

  end

  def new
    @new_topic = Topic.new
  end
end
