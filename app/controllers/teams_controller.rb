class TeamsController < ApplicationController
  before_action :set_team, only: [:show, :update, :destroy]

  def index
    @teams = Team.all
    render json: @teams
  end

  def show
    render json: @team
  end

  def create
    @team = Team.create(team_params)
    render json: @team
  end

  def update
    @team.update(team_params)
    render json: @team
  end

  def destroy
    @team.delete
    render json: true
  end

  private
    def set_team
      @team = Team.find(params[:id])
    end

    def team_params
      params.permit(
        :name
      )
    end
end
