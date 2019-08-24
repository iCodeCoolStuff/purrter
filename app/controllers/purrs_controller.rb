class PurrsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_purr, only: [:show, :edit, :update, :destroy]

  # GET /purrs
  # GET /purrs.json
  def index
    @purrs = Purr.all
  end

  # GET /purrs/1
  # GET /purrs/1.json
  def show
  end

  # GET /purrs/new
  def new
    @purr = Purr.new
  end

  # GET /purrs/1/edit
  def edit
  end

  # POST /purrs
  # POST /purrs.json
  def create
    @purr = Purr.new(purr_params)
    if @purr.save
      redirect_to home_url, notice: "Your Purr has been sent."
    else
      redirect_to home_url, alert: "Invalid form."
    end
  end

  # PATCH/PUT /purrs/1
  # PATCH/PUT /purrs/1.json
  def update
    respond_to do |format|
      if @purr.update(purr_params)
        format.html { redirect_to @purr, notice: 'Purr was successfully updated.' }
        format.json { render :show, status: :ok, location: @purr }
      else
        format.html { render :edit }
        format.json { render json: @purr.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /purrs/1
  # DELETE /purrs/1.json
  def destroy
    @purr.destroy
    respond_to do |format|
      format.html { redirect_to purrs_url, notice: 'Purr was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_purr
      @purr = Purr.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def purr_params
      params.require(:purr).permit(:content, :user_id)
    end
end
