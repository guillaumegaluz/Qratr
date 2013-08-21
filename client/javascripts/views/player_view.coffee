class @PlayerView extends Backbone.Model
	initialize: =>
		@loadedSound = null
		@loadedTrack = null
		@playing = false

	trackClicked: (track) =>
		if @trackIsLoaded(track)
			if @playing then @pause() else @resume()
		else
			@play(track)

	loadTrack: (track) =>
		@loadedTrack = track
		@updateControls()

	trackIsLoaded: (track) =>
		track.get('soundcloud_id') == @loadedTrack.get('soundcloud_id')  if @loadedTrack

	play: (track) =>
		@loadedSound.stop()  if @loadedSound

		@loadTrack(track)
		SC.stream @loadedTrack.get('soundcloud_id'), (sound) =>
			sound.play()
			@loadedSound = sound
		@playing = true

	pause: =>
		@loadedSound.pause()
		@playing = false

	resume: =>
		@loadedSound.play()
		@playing = true

	updateControls: =>
		trackArtist = @loadedTrack.get('artist')
		trackTitle = @loadedTrack.get('title')
		$('.track-artist').html(trackArtist)
		$('.track-artist').html(trackTitle)
