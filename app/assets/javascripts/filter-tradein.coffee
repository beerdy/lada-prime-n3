$( document ).ready ()->
  js_marka_select = $("#js-marka-select")
  setTimeout (->
    js_marka_select.find('.new-select').on 'DOMSubtreeModified', ->
      selected_option = $(this).text()
      setTimeout (->
        location.href = location.origin+location.pathname+"?bymodel="+selected_option
        return
      ), 500
    return
  ), 500

  js_lineup_select = $("#js-lineup-select")
  setTimeout (->
    js_lineup_select.find('.new-select').on 'DOMSubtreeModified', ->
      selected_option = $(this).text()
      setTimeout (->
        console.log location
        location.href = location.href+"&bylineup="+selected_option
        return
      ), 500
    return
  ), 500



