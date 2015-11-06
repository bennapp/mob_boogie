//= require flipclock.min

class Player
  createClock: ->
    @clock = $('#clock').FlipClock(parseInt($('#time_input').val()), { clockFace: 'MinuteCounter', countdown: true, autoStart: false })

  constructor: ->
    @initYouTube()
    @createClock()
    @setUpButtons()

    window.player = this

  setUpButtons: ->
    $('#start_timer').on('click', @startTimer)
    $('#pause_timer').on('click', @pauseTimer)
    $('#reset_timer').on('click', @resetTimer)
    $('#set_time').on('click', @getTimeInput)

  getTimeInput: =>
    @seconds = parseInt($('#time_input').val())
    @clock.setTime(@seconds)

  startTimer: =>
    @clock.start(@onTick)

  pauseTimer: =>
    @clock.stop()

  resetTimer: =>
    @getTimeInput()
    @video.pauseVideo()

  onTick: =>
    if @clock.getTime().time == 0
       @timesUp()

  timesUp: ->
    @video.playVideo()

  initYouTube: ->
    window.onYouTubeIframeAPIReady = =>
      new YT.Player 'player',
        height: '390'
        width: '640'
        videoId: 'GtUVQei3nX4'
        events: {
          'onReady': (event) => @video = event.target
        }

    @_setYouTubeOnWindow()

  _setYouTubeOnWindow: ->
    tag = document.createElement('script');
    tag.src = "https://www.youtube.com/iframe_api";
    firstScriptTag = document.getElementsByTagName('script')[0];
    firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

window.Player = Player
