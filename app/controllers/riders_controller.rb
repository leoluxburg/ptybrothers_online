class RidersController < ApplicationController
  def index
    @riders = Rider.all
  end

  def show
    @rider = Rider.find(params[:id])
  end

  def edit
    @rider = Rider.find(params[:id])
  end

  def update
    @rider = Rider.find(params[:id])
    @rider.update(rider_params)
    redirect_to rider_path(@rider)
  end

  def destroy
    @rider = rider.find(params[:id]).destroy
    redirect_to rider_path(@rider)
  end

  private

  def rider_params
    params.require(:rider).permit(:user_name, :first_name, :last_name, :age, :description, :country)
  end
end
