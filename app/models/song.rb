class Song < ActiveRecord::Base
	has_many :song_genres
	has_many :genres, :through => :song_genres
	belongs_to :artist

	def artist_name=(name)
		self.build_artist(:name => name)
	end

	def add_genres_by_ids(genre_ids)
		genre_ids.each do |genre_id|
    	self.song_genres.build(:genre_id => genre_id)
   	end if genre_ids.present?
	end

end
