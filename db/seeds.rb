class Seeds
	def self.generate_data
		self.generate_playlist
		self.generate_tracks
	end

	def self.generate_playlist
		@playlist = Playlist.create(:name => "A few songs to bring on a desert island")
	end

	def self.generate_tracks
		Track.create(:playlist_id => @playlist.id, :artist => "John Talabot", :title => "So Will Be Now")
		Track.create(:playlist_id => @playlist.id, :artist => "Roedelius", :title => "Fou Fou")
		Track.create(:playlist_id => @playlist.id, :artist => "The Durutti Column", :title => "The Missing Boy")
		Track.create(:playlist_id => @playlist.id, :artist => "Floorplan", :title => "Never Grow Old")
		Track.create(:playlist_id => @playlist.id, :artist => "Brian Eno", :title => "Through Hollow Lands")
		Track.create(:playlist_id => @playlist.id, :artist => "Plastikman", :title => "Contain")
		Track.create(:playlist_id => @playlist.id, :artist => "Jagwar Ma", :title => "Come Save Me")
	end
end