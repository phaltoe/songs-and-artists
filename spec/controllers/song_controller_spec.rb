require 'spec_helper'

describe 'SongsController' do
	let!(:artist) {Artist.create(:name => "MJ")}
	let!(:song) {Song.create(:name => "Thriller", :artist => artist)}

	describe 'GET /songs' do
		before do
			get '/songs'
		end

		it 'responds with a 200 status code' do
			expect(last_response).to be_ok
		end

		it 'contains the songs name in the body' do
			expect(last_response.body).to include(song.name)
		end

		it 'assigns an instance variable @songs with songs' do
		end

		it 'renders the index.html.erb' do
		end
	end

	describe 'GET /songs/:id/edit' do
		before do
			get "songs/#{song.id}/edit"
		end

		it 'responds with a 200 status code' do
			expect(last_response).to be_ok
		end
	end

	describe ' PATCH /songs/:id' do
		before do
			patch "/songs/#{song.id}", {
				:song => {:name => "Billie Jean"}
			}
		end

		it 'updates the song name' do
			expect(Song.find(song.id).name).to eq("Billie Jean")
		end

		it 'responds with a 301 status code' do
			expect(last_response).to be_a_redirect
		end
	end





end