class UsersController < ApplicationController
  def index
    @users = User.all
    render json: @users
  end

  def create
    user = User.new(user_params)

    if user.save!
      render json: user
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    user = User.find(params[:id])
    render json: user
  end

  def update

    user = User.find(params[:id])
    options_hash = user.attributes.merge(user_params)

    if user.update(options_hash)
      render json: user
    else
      render json: user.errors.full_messages, status: 404
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to users_url
  end

  private

  def user_params
    params.require(:user).permit(:username, :email)
  end
end
