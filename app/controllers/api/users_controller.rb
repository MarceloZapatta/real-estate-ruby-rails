class Api::UsersController < ApplicationController
  def index
    users = User.all
    render json: users, status: 200
  end

  def show
    user = User.find(params['id'])
    render json: user, status: 200
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user.as_json(only: ), status: 201
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def update
    user = User.find(params['id'])

    if user.update(user_params)
      render json: user, status: 200
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    user = User.find(params['id'])

    if user.destroy
      render json: { message: "User deleted with success!" }, status: 200
    else
      render json: { errors: "Unable to delete user" }, status: :unprocessable_entity
    end
  end

  private
    def user_params
      params.permit(:name, :email, :password, :password_confirmation, :active)
    end
end
