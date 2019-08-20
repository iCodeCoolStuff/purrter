class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @purrs = @user.purrs.order("id DESC")
  end
end