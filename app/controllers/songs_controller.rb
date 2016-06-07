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
    @song = Song.find(params[:id])

    # in genres_id I have an array of genres_id
    # for each of those ids I want to add genre with that id to @song
    @song.add_genres_by_ids(params[:genre_ids])
    @song.update(params[:song])


    redirect to "songs/#{@song.id}"
  end

  delete '/songs/:id/delete' do 
    @song = Song.find_by_id(params[:id])
    @song.delete
    
    redirect to '/songs'
  end
end
