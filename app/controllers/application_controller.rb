class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :new_purr

  def new_purr
    if user_signed_in?
      @new_purr = Purr.new
    end
  end

  def set_to_follow_users
    @to_follow_users = User.random_2_not(current_user)
  end
end
