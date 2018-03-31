App.chat = App.cable.subscriptions.create "ChatChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    $messages = $("##{data.id}")
    $messages.append "<p>#{data.message}</p>"
    $scroll = $('#messages')
    $scroll.scrollTop($messages.prop("scrollHeight"))

  reply: (message) ->
    @perform('reply', message: message)
