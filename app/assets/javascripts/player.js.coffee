# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
//= require flipclock.min

$(document).ready ->
  clock = $('.clock').FlipClock((20 * 60), { clockFace: 'MinuteCounter', countdown: true })

