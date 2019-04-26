class SongsController < ApplicationController
  def index
    @songs = Song.all
  end

  def show
    @song = Song.find(params[:id])
    #binding.pry
    @artist = @song.artist
    @genre = @song.genre
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(artist_params(:name, :artist_id, :genre_id))
    @song.save
    redirect_to @song
  end

  def update
    @song = Song.find(params[:id])
    @song.update(artist_params(:name))
    redirect_to @song
  end

  def edit
    @song = Song.find(params[:id])
  end

  private

  def artist_params(*args)
    params.require(:song).permit(*args)
  end
end
