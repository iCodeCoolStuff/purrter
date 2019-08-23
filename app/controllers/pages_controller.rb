class PagesController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def home
    @user = current_user
    @purrs = Purr.all.order("id DESC")
  end

  def explore
    @user = current_user
    @purrs = Purr.all.order("id DESC")
  end

  def index
  end
  
end
