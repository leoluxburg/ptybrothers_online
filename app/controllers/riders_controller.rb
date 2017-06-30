class RidersController < ApplicationController
  def index
    @riders = policy_scope(Rider)
  end

  def show
    @user = current_user
    @rider = Rider.find(params[:id])
    authorize @rider
  end

  def edit
    @rider = Rider.find(params[:id])
    authorize @rider
  end

  def update
    @rider = Rider.find(params[:id])
    @rider.update(rider_params)
    redirect_to rider_path(@rider)
    authorize @rider
  end


  private

  def rider_params
    params.require(:rider).permit(:user_name, :first_name, :last_name, :age, :description, :country, :photo, :photo_cache)
  end
end

