# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'turbolinks:load', ->
  $('#search-bicycles input').keyup ->
    $.get $('#search-bicycles').attr('action'), $('#search-bicycles').serialize(), null, 'script'
    false
  return