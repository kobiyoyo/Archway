class UsersController < ApplicationController
  before_action :set_user, only: [:users_profile]
  def index
    @users = User.where.not(id: current_user).where.not(id: current_user.friends)
  end

  def new
    @user = User.new
  end

  def show
    @user = current_user
  end

  def users_profile; end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
