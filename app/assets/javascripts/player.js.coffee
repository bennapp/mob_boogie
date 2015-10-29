//= require flipclock.min

class Player
  createClock: ->
    @clock = $('#clock').FlipClock(@seconds, { clockFace: 'MinuteCounter', countdown: true, autoStart: false })

  constructor: ->
    @initYouTube()
    @createClock()
    @setUpButtons()

    @$time_input = $('#time_input')
    @$time_input.on 'keyup', @onTimeEdit

    @getTimeInput()

    window.player = this

  setUpButtons: ->
    $('#start_timer').on('click', @startTimer)
    $('#pause_timer').on('click', @pauseTimer)
    $('#reset_timer').on('click', @resetTimer)

  getTimeInput: ->
    @seconds = parseInt(@$time_input.val())
    @$time_input.val(@seconds)
    @clock.setTime(@seconds)

  startTimer: =>
    @clock.start(@onTick)

  pauseTimer: =>
    @clock.stop()

  resetTimer: =>
    @getTimeInput()
    @video.pauseVideo()

  onTimeEdit: =>
    @getTimeInput() unless @clock.running

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
