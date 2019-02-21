class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  def index
    @users = User.all
    binding.pry
    render json: @users
  end

  def show
    render json: @user
  end

  def create
    @user = User.create(user_params)
    render json: @user
  end

  def update
    @user.update(user_params)
    render json: @user
  end

  def destroy
    @user.delete
    render json: true
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.permit(
        :first_name,
        :last_name
      )
    end
end
