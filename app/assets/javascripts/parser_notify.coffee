App.room = App.cable.subscriptions.create "ParserNotifyChannel",
  received: (data) ->
    console.log 'web socket message', data
    console_ = document.getElementById 'console'
    console_.innerHTML += '<li><code>[Загружаем..] '+data["modification"]+': <font color="'+data["rgb"]+'">'+data["color"]+'</font></code></li>'