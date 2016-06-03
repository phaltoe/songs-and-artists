class Song < ActiveRecord::Base
	has_many :song_genres
	has_many :genres, :through => :song_genres
	belongs_to :artist

	def artist_name=(name)
		self.build_artist(:name => name)
	end
end
