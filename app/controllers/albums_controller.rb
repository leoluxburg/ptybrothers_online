class AlbumsController < ApplicationController

  before_action :set_rider, only: [:new, :create]

  def index
    @albums = Album.all
  end

  def show
    @album = Album.find(params[:id])
  end

  def new
    @album = Album.new
  end

  def create
    @album = Album.create(album_params)
    @album.rider = @rider

    if @album.save
      redirect_to rider_path(@rider)
    else
      render :new
    end
  end

  private

  def album_params
    params.require(:album).permit(:title, :photographer, :location)
  end

  def set_rider
    @rider = Rider.find(params[:rider_id])
  end

end


