class TeamsController < ApplicationController
  before_action :set_team, only: [:show, :edit, :update, :destroy]

  # GET /teams
  def index
    @teams = Team.all
    respond_to do |format|
      format.html
      format.turbo_stream
    end
  end

  # GET /teams/:id
  def show
  end

  # GET /teams/new
  def new
    @team = Team.new
  end

  # POST /teams
  def create
    @team = Team.new(team_params)
    if @team.save
      respond_to do |format|
        format.html { redirect_to teams_path, notice: "Team successfully created!" }
        format.turbo_stream { flash.now[:notice] = "Team successfully created!" }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  # GET /teams/:id/edit
  def edit
  end

  # PATCH/PUT /teams/:id
  def update
    if @team.update(team_params)
      respond_to do |format|
        format.html { redirect_to teams_path, notice: "Team successfully updated!" }
        format.turbo_stream { flash.now[:notice] = "Team successfully updated!" }
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /teams/:id
  def destroy
    @team.destroy
    respond_to do |format|
      format.html { redirect_to teams_path, notice: "Team successfully deleted!" }
      format.turbo_stream { flash.now[:notice] = "Team successfully deleted!" }
    end
  end

  private

  def set_team
    @team = Team.find(params[:id])
  end

  def team_params
    params.require(:team).permit(:name, :institution, :start_date, :end_date)
  end
end
