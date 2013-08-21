class @PlayerView extends Backbone.Model
	initialize: =>
		@loadedSound = null
		@loadedTrackId = null
		@playing = false

	trackClicked: (track) =>
		if @trackIsLoaded(track)
			if @playing then @pause() else @resume()
		else
			@play(track)

	play: (track) =>
		@loadedSound.stop()  if @loadedSound
		@loadedTrackId = track.get('soundcloud_id')
		SC.stream @loadedTrackId, (sound) =>
			sound.play()
			@loadedSound = sound
		@playing = true

	trackIsLoaded: (track) =>
		track.get('soundcloud_id') == @loadedTrackId

	pause: =>
		@loadedSound.pause()
		@playing = false

	resume: =>
		@loadedSound.play()
		@playing = true
