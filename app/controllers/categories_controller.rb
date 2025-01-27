class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  # GET /categories
  def index
    @categories = Category.all
    respond_to do |format|
      format.html
      format.turbo_stream
    end
  end

  # GET /categories/:id
  def show
  end

  # GET /categories/new
  def new
    @category = Category.new
  end

  # POST /categories
  def create
    @category = Category.new(category_params)
    if @category.save
      respond_to do |format|
        format.html { redirect_to categories_path, notice: "Category successfully created!" }
        format.turbo_stream { flash.now[:notice] = "Category successfully created!" }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  # GET /categories/:id/edit
  def edit
  end

  # PATCH/PUT /categories/:id
  def update
    if @category.update(category_params)
      respond_to do |format|
        format.html { redirect_to categories_path, notice: "Category successfully updated!" }
        format.turbo_stream { flash.now[:notice] = "Category successfully updated!" }
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /categories/:id
  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to categories_path, notice: "Category successfully deleted!" }
      format.turbo_stream { flash.now[:notice] = "Category successfully deleted!" }
    end
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
