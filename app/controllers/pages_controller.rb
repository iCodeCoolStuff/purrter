class PagesController < ApplicationController

  def home
    @user = current_user
  end

  def index
  end
  
end
