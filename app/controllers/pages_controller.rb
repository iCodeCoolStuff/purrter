class PagesController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_to_follow_users, except: [:index]

  def home
    @user = current_user
    @purrs = Purr.where("user_id IN (?) OR user_id = ?",  @user.following_ids, @user.id).order("id DESC")
  end

  def explore
    @user = current_user
    @purrs = Purr.all.order("id DESC")
  end

  def index
    if user_signed_in?
      redirect_to home_url
    end
  end
end
