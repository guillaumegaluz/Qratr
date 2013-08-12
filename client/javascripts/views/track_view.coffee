class @TrackView extends Backbone.View
	events:
		'click': 'play'

	initialize: (options) =>
	  @track = options.model
	  @playing = false

	play: =>
		return  if @playing
		@playing = true
		SC.stream @track.get('permalink_url'), (sound) ->
  		sound.play()
