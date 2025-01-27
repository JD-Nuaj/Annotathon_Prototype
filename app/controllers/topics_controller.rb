class TopicsController < ApplicationController
  before_action :set_forum
  before_action :set_topic, only: %i[show edit update destroy]

  def index
    @topics = @forum.topics
  end

  def show
    @posts = @topic.posts
  end

  def new
    @topic = @forum.topics.new
  end

  def create
    @topic = @forum.topics.new(topic_params)
    if @topic.save
      redirect_to forum_topic_path(@forum, @topic), notice: 'Topic successfully created.'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @topic.update(topic_params)
      redirect_to forum_topic_path(@forum, @topic), notice: 'Topic successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @topic.destroy
    redirect_to forum_topics_path(@forum), notice: 'Topic successfully deleted.'
  end

  private

  def set_forum
    @forum = Forum.find(params[:forum_id])
  end

  def set_topic
    @topic = @forum.topics.find(params[:id])
  end

  def topic_params
    params.require(:topic).permit(:title, :description)
  end
end
