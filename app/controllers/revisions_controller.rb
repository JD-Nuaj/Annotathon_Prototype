class RevisionsController < ApplicationController
  before_action :set_annotation

  # GET /annotations/:annotation_id/revisions
  def index
    @revisions = @annotation.revisions
    respond_to do |format|
      format.html
      format.turbo_stream
    end
  end

  # POST /annotations/:annotation_id/revisions
  def create
    @revision = @annotation.revisions.build(revision_params)
    if @revision.save
      respond_to do |format|
        format.html { redirect_to annotation_revisions_path(@annotation), notice: "Revision created!" }
        format.turbo_stream { flash.now[:notice] = "Revision created!" }
      end
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def set_annotation
    @annotation = Annotation.find(params[:annotation_id])
  end

  def revision_params
    params.require(:revision).permit(:content)
  end
end
