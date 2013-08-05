class Seeds
	def self.generate_data
		Playlist.destroy_all
		Track.destroy_all
		self.generate_playlist
		self.generate_tracks
	end

	def self.generate_playlist
		@playlist = Playlist.create(:name => "A few songs to bring on a desert island")
	end

	def self.generate_tracks
		Track.create(:playlist_id => @playlist.id, :artist => "terek ke", :title => "Pianodub", :permalink_url => "https://soundcloud.com/terekke/pianodub", :track_path => "/tracks/101719374")
		Track.create(:playlist_id => @playlist.id, :artist => "HNNY", :title => "Mys (Young Marco Remix)", :permalink_url => "https://soundcloud.com/youngmarco/hnny-mys-young-marco-remix")
		Track.create(:playlist_id => @playlist.id, :artist => "Wake Up", :title => "Rising Sun", :permalink_url => "https://soundcloud.com/wake-up-records/wake-up-001-rising-sun-b1?in=wake-up-records/sets/wake-up-001-rising-sun-awake")
		Track.create(:playlist_id => @playlist.id, :artist => "Hailu Mergia", :title => "Shilela", :permalink_url => "https://soundcloud.com/awesometapesfromafrica/shilela")
		Track.create(:playlist_id => @playlist.id, :artist => "Fort Romeau", :title => "Jetee", :permalink_url => "https://soundcloud.com/ghostly/fort-romeau-jetee")
		Track.create(:playlist_id => @playlist.id, :artist => "Florence Ayiero", :title => "Orchestra Manga Kings", :permalink_url => "https://soundcloud.com/analog-africa/florence-ayiero-orchestra")
		Track.create(:playlist_id => @playlist.id, :artist => "Future Islands", :title => "Before the Bridge", :permalink_url => "https://soundcloud.com/thrilljockey/future-islands-before-the")
	end
end
