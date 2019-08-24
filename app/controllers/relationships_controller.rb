class RelationshipsController < ApplicationController
  before_action :authenticate_user!

  def create 
    user = User.find(params[:followed_id])
    current_user.follow(user)
    flash[:notice] = "User was successfully followed!"
    redirect_back fallback_location: "/home"
  end

  def destroy
    user = Relationship.find(params[:id]).followed
    current_user.unfollow(user)
    flash[:notice] = "User was successfully unfollowed!"
    redirect_back fallback_location: "/home"
  end
end