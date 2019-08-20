class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :new_purr

  def new_purr
    @new_purr = Purr.new
  end
end
