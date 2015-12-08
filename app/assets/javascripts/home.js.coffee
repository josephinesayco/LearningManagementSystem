# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


jQuery ($) ->
  $(document).ready ->
    if $('#user_course option:selected').val() == "CS"
      $('#user_section option:gt(3)').hide()
    return

  $('#user_course').change (e) ->
    sec_options = $('#user_section option')
    $(sec_options).show()
    if this.value == "CT" || this.value == "CS"
      $('#user_section option:gt(3)').hide()
      index = $("#user_section option:selected").index()

      if index > 3
        $("#user_section option:first").attr('selected','selected');
