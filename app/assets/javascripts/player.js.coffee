# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
//= require flipclock.min

class Player
  createClock: ->
    seconds = (20 * 60)
    @clock = $('#clock').FlipClock(seconds, { clockFace: 'MinuteCounter', countdown: true, autoStart: false })

  initYouTube: =>
    youTubeDeferred = $.Deferred();
    window.onYouTubeIframeAPIReady = ->
      youTubeDeferred.resolve(window.YT)

    tag = document.createElement('script');
    tag.src = "https://www.youtube.com/iframe_api";
    firstScriptTag = document.getElementsByTagName('script')[0];
    firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

    youTubeDeferred.done =>
      player = new YT.Player 'player',
        height: '390'
        width: '640'
        videoId: 'GtUVQei3nX4'
        events: {
          'onReady': @setPlayer
        }

  setPlayer: (event) =>
    @video = event.target

  play: ->
    @initYouTube() # @video, We have a loading problem with video do we care?
    @createClock() # @clock

    window.player = this

#    player.clock.start()
#    player.clock.stop()

#    player.video.playVideo()
#    player.video.stopVideo()

window.Player = Player
