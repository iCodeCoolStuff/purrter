class PagesController < ApplicationController

  def home
    @user = current_user
    @purrs = Purr.all.order("id DESC")
  end

  def explore
    @user = current_user
    @purrs = Purr.all.order("id DESC")
  end
  
end
