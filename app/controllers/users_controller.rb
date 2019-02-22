class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  def index
    @users = User.all
    render json: @users, include: [:team]
  end

  def show
    render json: @user
  end

  def create
    @user = User.create(user_params)

    if @user.save
      render json: @user, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @user.delete
      render json: true
    else
      render json: false
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.permit(
        :first_name,
        :last_name,
        :birthdate,
        :gamertag,
        :team_id
      )
    end
end
