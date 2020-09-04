$(document).ready ->
  $("#send-button").on "click", (event) ->
    $('#send-message-wait').show()

  $("#send-message").on("ajax:success", (event) ->
    $('#send-message-data').hide()
    $('#send-message-ok').show()
    $('#send-message-error').hide()
    $('#send-message-wait').hide()
  ).on "ajax:error", (event) ->
    $('#send-message-data').hide()
    $('#send-message-ok').hide()
    $('#send-message-error').show()
    $('#send-message-wait').hide()

