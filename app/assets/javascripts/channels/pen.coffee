App.pen = App.cable.subscriptions.create "PenChannel",
  connected: ->
    # Called when the subscription is ready for use on the server
     $('#status').html("Connected!")
  disconnected: ->
    # Called when the subscription has been terminated by the server

  receive: (data) ->
    # Called when there's incoming data on the websocket for this channel
    $('#status').html("DRAWING")
