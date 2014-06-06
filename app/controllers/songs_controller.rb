class SongsController < ApplicationController

  def index
    @song = Song.new
    @songs = Song.all
  end

  def create
    @song = Song.create(song_params)
    if @song.save
      redirect_to songs_path
    else
      render :index
    end
  end

  def show
    @song = Song.find(params[:id])
  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id])
    @song.update_attributes!(song_params)

    redirect_to songs_path
  end

  private
  def song_params
    params.require(:song).permit(:title, :artist)
  end
end