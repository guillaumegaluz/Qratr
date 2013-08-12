class @TrackView extends Backbone.View
	events:
		'click': 'play'

	initialize: (options) =>
		@track = options.model

	play: =>
		SC.stream @track.get('permalink_url'), (sound) ->
  		sound.play()
