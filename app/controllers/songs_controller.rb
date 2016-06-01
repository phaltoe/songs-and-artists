class SongsController < ApplicationController

  get '/songs' do #INDEX Action
    "Here are all the songs"
  end

  get '/songs/new' do #NEW Action

    erb :"songs/new.html"
  end

  post '/songs' do #CREATE Action
    # @song = Song.new
    @song = Song.new(params)
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

end
