require 'spec_helper'

describe "Song Forms", :feature => true do
	let(:artist_name) { "Person With a Face" }
	let(:song_name) { "That One With a Guitar" }

	describe "Creating a new Song" do 
		before do
			visit "/songs/new"
		end

		it 'renders the new song form' do
			expect(page).to have_css("form[action='/songs']")
		end

		it 'feels in the form with proper data' do
			fill_in 'song[name]', :with => song_name
			fill_in 'song[artist_name]', :with => artist_name
			click_button 'Submit'

			expect(Song.find_by(:name => song_name)).to be_truthy
		end
	end

	describe "Editing a Song" do
		before do
			@song = Song.create(:name => song_name, :artist_name => artist_name)
			@pop = Genre.create(:name => "Pop")
			@rock = Genre.create(:name => "Rock")

			visit "/songs/#{@song.id}/edit"

		end

		context 'with genres' do
			it 'loads an edit form with genres to select' do
				# save_and_open_page
				check "genre_#{@rock.id}"
				click_button "Submit"

				expect(page).to have_content("Rock")
				expect(page).to_not have_content("Pop")
			end
		end
	end
end