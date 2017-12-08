class UsersController < ApplicationController
  before_action :authorize

  def index
    users = User.includes(:skills, :interviews, :companies_applied_to)
    render json: users.map(&:json_with_associations)
  end

  def show
    user = User.find_by(id: params[:id])
    if user
      render json: user.json_with_associations
    else
      render json: []
    end
  end

  def create
    User.new(user_params)
    if user.save
      render json: user.json_with_associations
    else
      render json: {errors: user.errors.full_messages}, status: 422
    end
  end

  def update
    user = User.find_by(id: params[:id])
    if user.update(user_params)
      render json: user.json_with_associations
    else
      render json: {errors: user.errors.full_messages}, status: 422
    end
  end

  def destroy
    user = User.find_by(id: params[:id])
    user.destroy
    render json: {message: "User destroyed"}
  end

  def profile
    user = current_user
    if user
      render json: user.json_with_associations
    else
      render json: {}
    end
  end

  private
  
  def user_params
    params.require(:user).permit(:name, :year, :cohort, :location, :email, :linkedin_url, :github_url, :facebook_url, :current_company, :current_position, :photo_url)
  end
end
