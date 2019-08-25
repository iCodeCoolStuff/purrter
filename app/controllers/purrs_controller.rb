class PurrsController < ApplicationController
  before_action :authenticate_user!

  def create
    @purr = Purr.new(purr_params)
    if @purr.save
      redirect_to home_url, notice: "Your Purr has been sent."
    else
      redirect_to home_url, alert: "Invalid form."
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def purr_params
      params.require(:purr).permit(:content, :user_id)
    end
end
