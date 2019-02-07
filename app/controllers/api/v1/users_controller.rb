class Api::V1::UsersController < ApplicationController
  before_action :find_user, only: [:update, :show]
  skip_before_action :authorized, only: [:index, :show, :create]
  def index
    @users = User.all
    render json: @users
  end

  def show
    render json:@user
  end

  def profile
      render json: { user: UserSerializer.new(current_user) }, status: :accepted
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      token = JWT.encode({user_id: @user.id} ,'yummers')
      render json: { user: @user, jwt: token }
    else
      render json: { error: 'failed to create user' }, status: 422
    end
  end

  def update
    @user.update(user_params)
    if @user.save
      render json: @user, status: :accepted
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessible_entity
    end
  end

  private

  def user_params
    params.permit(:first_name, :last_name, :username, :address, :bio, :email, :requests, :password)
  end

  def find_user
    @user = User.find(params[:id])
  end
end
