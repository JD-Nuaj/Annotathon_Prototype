class AnnotationsController < ApplicationController
  before_action :set_annotation, only: [:show, :edit, :update, :destroy]

  # GET /annotations
  def index
    @annotations = Annotation.all
    respond_to do |format|
      format.html
      format.turbo_stream
    end
  end

  # GET /annotations/:id
  def show
  end

  # GET /annotations/new
  def new
    @annotation = Annotation.new
  end

  # POST /annotations
  def create
    @annotation = Annotation.new(annotation_params)
    if @annotation.save
      respond_to do |format|
        format.html { redirect_to annotations_path, notice: "Annotation successfully created!" }
        format.turbo_stream { flash.now[:notice] = "Annotation successfully created!" }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  # GET /annotations/:id/edit
  def edit
  end

  # PATCH/PUT /annotations/:id
  def update
    if @annotation.update(annotation_params)
      respond_to do |format|
        format.html { redirect_to annotations_path, notice: "Annotation successfully updated!" }
        format.turbo_stream { flash.now[:notice] = "Annotation successfully updated!" }
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /annotations/:id
  def destroy
    @annotation.destroy
    respond_to do |format|
      format.html { redirect_to annotations_path, notice: "Annotation successfully deleted!" }
      format.turbo_stream { flash.now[:notice] = "Annotation successfully deleted!" }
    end
  end

  private

  def set_annotation
    @annotation = Annotation.find(params[:id])
  end

  def annotation_params
    params.require(:annotation).permit(:content, :team_id, :category_id)
  end
end
