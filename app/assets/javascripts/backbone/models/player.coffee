class @Player extends Backbone.Model
  initialize: =>
    playerState.on('change:paused', @togglePlayback)
    playerState.on('change:currentTrack', @play)

  togglePlayback: =>
    if playerState.get('paused') then @pause() else @resume()

  play: =>
    playerState.get('currentSound').stop()  if playerState.get('currentSound')
    @incrementListenCount()

    SC.stream playerState.get('currentTrack').get('soundcloud_id'), (sound) =>
      console.log("[Now Playing] #{playerState.get('currentTrack').get('artist')} - '#{playerState.get('currentTrack').get('title')}'")
      sound.play(
        onfinish: =>
          playerState.setNextTrack()
          mixpanel.track("Track Auto Next");
      )
      playerState.set('currentSound', sound)

  pause: =>
    playerState.get('currentSound').pause()

  resume: =>
    playerState.get('currentSound').play()

  incrementListenCount: =>
    newListenCount = playerState.get('currentTrack').get('play_count') + 1
    # TODO - Save only the changed attributes
    playerState.get('currentTrack').set('play_count', newListenCount).save({patch: true})
