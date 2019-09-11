class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    purr = Purr.find(params[:purr_id])
    current_user.like(purr)
    flash[:notice] = "You liked this purr!"
    redirect_back fallback_location: "/home"
  end

  def destroy
    purr = Like.find(params[:id]).purr
    current_user.unlike(purr)
    flash[:notice] = "You unliked this purr!"
    redirect_back fallback_location: "/home"
  end
end