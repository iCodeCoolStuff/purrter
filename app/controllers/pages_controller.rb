class PagesController < ApplicationController

  def home
    @user = current_user
    @purrs = @user.purrs
  end

  def index
  end
  
end
