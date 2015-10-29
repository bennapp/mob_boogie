# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
//= require flipclock.min

class Player
  createClock: ->
    seconds = (20 * 60)
    $('.clock').FlipClock(seconds, { clockFace: 'MinuteCounter', countdown: true })

  initYouTube: ->
    tag = document.createElement('script');
    tag.src = "https://www.youtube.com/iframe_api";
    firstScriptTag = document.getElementsByTagName('script')[0];
    firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

  play: ->
#    initYouTube()
    clock = @createClock()
    video = @createVideo()



window.Player = Player
