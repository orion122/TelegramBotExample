App.chat = App.cable.subscriptions.create "ChatChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    $messages = $("##{data.id}")
    $incoming = "<p>#{data.message}</p>"
    $outgoing = "<div id='1'></div>"
    $messages.append $incoming + $outgoing
    $scroll = $('#messages')
    $scroll.scrollTop($messages.prop("scrollHeight"))

  reply: (message) ->
    @perform('reply', message: message)
