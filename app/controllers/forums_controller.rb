class ForumsController < ApplicationController
  before_action :set_forum, only: [:show, :edit, :update, :destroy]

  # GET /forums
  def index
    @forums = Forum.all
    respond_to do |format|
      format.html # Vue classique pour les navigateurs
      format.turbo_stream # Pour Turbo Frames (SPA-like)
    end
  end

  # GET /forums/:id
  def show
    @topics = @forum.topics
  end

  # GET /forums/new
  def new
    @forum = Forum.new
  end

  # POST /forums
  def create
    @forum = Forum.new(forum_params)
    if @forum.save
      redirect_to forums_path, notice: "Forum created successfully!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  # GET /forums/:id/edit
  def edit
  end

  # PATCH/PUT /forums/:id
  def update
    if @forum.update(forum_params)
      redirect_to forums_path, notice: "Forum updated successfully!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /forums/:id
  def destroy
    @forum.destroy
    redirect_to forums_path, notice: "Forum deleted successfully!"
  end

  private

  def set_forum
    @forum = Forum.find(params[:id])
  end

  def forum_params
    params.require(:forum).permit(:name, :description)
  end
end

