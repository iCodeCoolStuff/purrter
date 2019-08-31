class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @purrs = @user.purrs.order("id DESC")
    set_to_follow_users
  end
end