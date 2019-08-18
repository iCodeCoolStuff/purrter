class PagesController < ApplicationController

  def home
    @user = current_user
    @purrs = Purr.all.order("id DESC")
  end

  def index
  end
  
end
