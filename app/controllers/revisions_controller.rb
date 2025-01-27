class RevisionsController < ApplicationController
  before_action :set_revision, only: %i[show edit update destroy]

  def index
    @revisions = Revision.all
  end

  def show; end

  def new
    @revision = Revision.new
  end

  def create
    @revision = Revision.new(revision_params)
    if @revision.save
      redirect_to @revision, notice: 'Revision was successfully created.'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @revision.update(revision_params)
      redirect_to @revision, notice: 'Revision was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @revision.destroy
    redirect_to revisions_url, notice: 'Revision was successfully deleted.'
  end

  private

  def set_revision
    @revision = Revision.find(params[:id])
  end

  def revision_params
    params.require(:revision).permit(:annotation_id, :user_id, :change_log)
  end
end
