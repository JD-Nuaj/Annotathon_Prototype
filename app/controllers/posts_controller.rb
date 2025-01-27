class PostsController < ApplicationController
  before_action :set_topic
  before_action :set_post, only: %i[edit update destroy]

  def create
    @post = @topic.posts.new(post_params.merge(user: current_user))
    if @post.save
      redirect_to forum_topic_path(@topic.forum, @topic), notice: 'Post successfully created.'
    else
      render 'topics/show'
    end
  end

  def edit; end

  def update
    if @post.update(post_params)
      redirect_to forum_topic_path(@topic.forum, @topic), notice: 'Post successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to forum_topic_path(@topic.forum, @topic), notice: 'Post successfully deleted.'
  end

  private

  def set_topic
    @topic = Topic.find(params[:topic_id])
  end

  def set_post
    @post = @topic.posts.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:content)
  end
end
