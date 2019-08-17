class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @purrs = @user.purrs
  end
end