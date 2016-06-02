class SongsController < ApplicationController

  get '/songs' do #INDEX Action
    "Here are all the songs"
    # @songs = Song.all
    # erb :'/songs/index.html'
  end

  get '/songs/new' do #NEW Action

    erb :"songs/new.html"
  end

  post '/songs' do #CREATE Action
    # @song = Song.new
    @song = Song.new(params[:song])
    # @song = Song.create(:name => params[:song_name] )
    # @song.artist_name = params[:artist_name]
    # @song.name = params[:song_name]
    # if !params[:artist_name].empty?
    #   @song.artist = Artist.create(:name => params[:artist_name])
    # end
    @song.save

    redirect to "songs/#{@song.id}"
  end

  get '/songs/:id' do #SHOW Action
    @song = Song.find(params[:id])
    erb :"songs/show.html"
  end

  get '/songs/:id/edit' do #EDIT action
    @song = Song.find(params[:id])
    erb :"songs/edit.html"
  end

  patch '/songs/:id' do #UPDATE action
    @song = Song.find(params[:id])
    # raise params.inspect
    @song.update(params[:song])
    # @song.name = params[:name]
    # @song.artist_name = params[:artist_name]
    # @song.save

    redirect to "songs/#{@song.id}"
  end
end
