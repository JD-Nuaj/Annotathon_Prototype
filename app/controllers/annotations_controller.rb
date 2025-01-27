class AnnotationsController < ApplicationController
  before_action :set_annotation, only: %i[show edit update destroy]

  def index
    @annotations = Annotation.all
  end

  def show; end

  def new
    @annotation = Annotation.new
  end

  def create
    @annotation = Annotation.new(annotation_params)
    if @annotation.save
      redirect_to @annotation, notice: 'Annotation was successfully created.'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @annotation.update(annotation_params)
      redirect_to @annotation, notice: 'Annotation was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @annotation.destroy
    redirect_to annotations_url, notice: 'Annotation was successfully deleted.'
  end

  private

  def set_annotation
    @annotation = Annotation.find(params[:id])
  end

  def annotation_params
    params.require(:annotation).permit(:user_id, :sequence, :status, :grade, :comment)
  end
end
