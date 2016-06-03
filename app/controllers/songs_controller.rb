class SongsController < ApplicationController

  get '/songs' do #INDEX Action
    # "Here are all the songs"
    @songs = Song.all
    erb :'/songs/index.html'
  end

  get '/songs/new' do #NEW Action

    erb :"songs/new.html"
  end

  post '/songs' do #CREATE Action
    @song = Song.new(params[:song])
    @song.save

    redirect to "songs/#{@song.id}"
  end

  get '/songs/:id' do #SHOW Action
    @song = Song.find(params[:id])
    erb :"songs/show.html"
  end

  get '/songs/:id/edit' do #EDIT action
    @genres = Genre.all
    @song = Song.find(params[:id])
    erb :"songs/edit.html"
  end

  patch '/songs/:id' do #UPDATE action
    raise params.inspect
    @song = Song.find(params[:id])
    @song.update(params[:song])

    redirect to "songs/#{@song.id}"
  end
end
