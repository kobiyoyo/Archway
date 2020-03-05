class FriendshipsController < ApplicationController
  before_action :find_user, only: %i[create accept deny destroy]

  def index
    @user = current_user
    @friends = @user.friends
    @pending_friends = @user.pending_friends
    @requested_friends = @user.requested_friends
  end

  def create
    Friendship.request(@user_one, @friend)
    flash[:success] = "Friend request has been sent to #{@friend.first_name} #{@friend.last_name}."
    redirect_to user_path(@friend)
  end

  def accept
    Friendship.accept(@user_one, @friend)
    flash[:success] = "Friend request from #{@friend.email} has been accepted."
    redirect_to friends_path
  end

  def deny
    Friendship.breakup(@user_one, @friend)
    flash[:danger] = "Friend request from #{@friend.email} has been declined."
    redirect_to friends_path
  end

  def destroy
    Friendship.breakup(@user_one, @friend)
    flash[:danger] = "#{@friend.email} has been removed from your friends list."
    redirect_to friends_path
  end

  private

  def find_user
    @user_one = current_user
    @friend = User.find(params[:id])
  end
end
