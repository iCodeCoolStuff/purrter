class PagesController < ApplicationController

  def home
    @user = current_user
    @purrs = @user.purrs.to_a
  end

  def index
  end
  
end
