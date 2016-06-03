require 'spec_helper'

describe Song do
	context 'With Artists' do
		context 'artist_name=' do
			it 'assigns one artist to the song by name' do
				song = Song.new
				song.artist_name = "Kanye West"

				expect(song.artist.name).to eq("Kanye West")
			end
		end
	end

	describe '#add_genres_by_ids' do
		it 'add genres by ids' do
			@pop = Genre.create(:name => "Pop")
			@rock = Genre.create(:name => "Rock")

			song = Song.new
			song.add_genres_by_ids([@pop.id, @rock.id])
			song.save

			expect(song.genres).to include(@pop)
			expect(song.genres).to include(@rock)
	 	end
	end	

end