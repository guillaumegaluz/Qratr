class @Playlist extends Backbone.Model
	initialize: =>
		console.log @
		@tracks = new Tracks(@get('tracks') || [])
