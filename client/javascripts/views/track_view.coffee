class @TrackView extends Backbone.View
	initialize: (options) =>
		@track = options.model
		@bindEvents()

	bindEvents: =>
		@$el.on('click', @play)

	play: =>
		console.log "play, dance"
		SC.stream @track.permalink_url, (sound) ->
  		sound.play()
