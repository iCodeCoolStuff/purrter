class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :purr_if_signed_in

  def purr_if_signed_in
    if user_signed_in?
      @new_purr = Purr.new
    end
  end
end
