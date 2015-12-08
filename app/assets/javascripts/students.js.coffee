# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ($) ->
    $('a[data-toggle=modal]').on 'click', ->
    $('.dropdown').removeClass('open')

  $('a[data-target=#ajax-modal]').on 'click', (e)->
     e.preventDefault()
     e.stopPropagation();

  $(document).on 'click', '[data-dismiss=modal], .modal-scrollable', ->
    $('.modal-body-content').empty()

  $(document).on 'click', '#ajax-modal', (e) ->
    e.stopPropagation();