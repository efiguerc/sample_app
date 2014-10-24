# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

updateCount = ->
  msg = 140 - jQuery("#micropost_content").val().length
  $("#char_count").text 'Chars remaining: ' + msg
  return

$(document).ready ->
  $("#char_count").text "Chars remaining: 140"
  $("#micropost_content").on("change keyup keydown keypress paste drop",
                             updateCount)
