class @PlaylistView extends Backbone.View
	el: '.playlist-container'

	initialize: (options = {}) =>
    @playlist = options.model
    console.log @playlist.get('tracks')
    @initializeTracksViews()

  initializeTracksViews: =>
  	@$el.find('.track-container').each (i, trackElement) =>
      $trackElement = $(trackElement)
      track = @playlist.tracks.find (t) ->
        t.get('track').id == $trackElement.data('track-id')
      new TrackView(el: trackElement, model: track.get('track'))
