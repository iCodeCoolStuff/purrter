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
  
  def edit
    @purr = Purr.find(params[:id])
    if not @purr.user.id.equal? current_user.id
      flash[:notice] = "Not allowed to edit that purr"
      redirect_back fallback_location: "/home"
    end
  end

  def update
    @purr = Purr.find(params[:id])

    if @purr.user.id.equal? current_user.id
      if @purr.update_attributes(purr_params)
        flash[:notice] = "Purr successfully updated!"
        redirect_back fallback_location: "/home"
      else
        flash[:notice] = "Unable to update purr."
        redirect_back fallback_location: "/home"
      end
    else
      flash[:notice] = "Not allowed to edit that purr."
      redirect_back fallback_location: "/home"
    end
  end

  def destroy
    purr = Purr.find(params[:id])
    
    if not current_user.id == purr.user.id
      flash[:notice] = "Not allowed to delete that purr."
      redirect_back fallback_location: "/home"
    else
      purr.destroy
      flash[:notice] = "Purr successfully deleted!"
      redirect_back fallback_location: "/home"
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def purr_params
      params.require(:purr).permit(:content, :user_id)
    end
end
