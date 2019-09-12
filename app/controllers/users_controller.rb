class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @purrs = @user.purrs.order("id DESC")
    set_to_follow_users
  end

  def following
  end

  def followers
  end

  def likes
    @user = User.find(params[:id])
    @purrs = @user.liked_purrs
  end
end