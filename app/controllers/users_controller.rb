class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  def index
    @users = User.all
    respond_to do |format|
      format.html
      format.turbo_stream
    end
  end

  # GET /users/:id
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # POST /users
  def create
    @user = User.new(user_params)
    if @user.save
      respond_to do |format|
        format.html { redirect_to users_path, notice: "User successfully created!" }
        format.turbo_stream { flash.now[:notice] = "User successfully created!" }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  # GET /users/:id/edit
  def edit
  end

  # PATCH/PUT /users/:id
  def update
    if @user.update(user_params)
      respond_to do |format|
        format.html { redirect_to users_path, notice: "User successfully updated!" }
        format.turbo_stream { flash.now[:notice] = "User successfully updated!" }
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /users/:id
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_path, notice: "User successfully deleted!" }
      format.turbo_stream { flash.now[:notice] = "User successfully deleted!" }
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :password, :role, :name)
  end
end

