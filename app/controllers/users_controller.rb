class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user
  before_action :set_to_follow_users

  def show
    @purrs = @user.purrs.order("id DESC")
    set_to_follow_users
  end

  def following
    @following = @user.following.where.not(id: current_user.id)
  end

  def followers
    @followers = @user.followers.where.not(id: current_user.id)
  end

  def likes
    @purrs = @user.liked_purrs
  end

  private

    def set_user
      @user = User.find(params[:id])
    end
end