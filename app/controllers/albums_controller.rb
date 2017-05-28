class AlbumsController < ApplicationController

  before_action :set_rider, only: [:new, :create]

  def index
    @albums = policy_scope(Album)
  end

  def show
    @album = Album.find(params[:id])
    authorize @album

  end

  def new
    if @rider.team_rider
      @album = Album.new
      authorize @album
    else
      redirect_to root_path
    end
  end

  def create
    if @rider.team_rider
      @album = Album.create(album_params)
      @album.rider = current_user.rider
      authorize @album

      if @album.save
        redirect_to rider_path(@rider)
      else
        render :new
      end
    end
  end

  def edit
    @album = Album.find(params[:id])
    authorize @album
  end

  def update
    @album = Album.find(params[:id])
    @album.update(album_params)
    redirect_to album_path(@album)
    authorize @album
  end

  def destroy
    @album = Album.find(params[:id]).destroy
    redirect_to root_path
    authorize @album
  end

  private

  def album_params
    params.require(:album).permit(:title, :photographer, :location, photos:[])
  end

  def set_rider
    @rider = Rider.find(params[:rider_id])
  end

end


