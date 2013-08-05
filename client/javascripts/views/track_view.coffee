class @TrackView extends Backbone.View
	initialize: =>
		@bindEvents()

	bindEvents: =>
		@$el.on('click', @play)

	play: =>
		console.log "play, dance"
