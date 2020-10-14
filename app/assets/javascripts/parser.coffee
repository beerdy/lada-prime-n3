$( document ).ready ()->
  $('.parse-model').on 'ajax:beforeSend', () ->
    o = $(this).parents('.control-panel-parser')
    o.find('.ok').hide();
    o.find('.status').show();
  $('.parse-model').on 'ajax:complete', () ->
    o = $(this).parents('.control-panel-parser')
    o.find('.status').hide();
    o.find('.ok').show();

# Avito
$( document ).ready ()->
  $('#js-import-avito').on 'click', (e) ->
    e.preventDefault()
    console.log 'import avito'
    $.ajax
      url: '/tradein/parsers'
      type: 'post'
      data: {
        link_import_avito: $('#link_import_avito').val()
      }
      dataType: 'json'
      beforeSend: ->
        $('#mess').remove()
        $('#link_import_avito').val('')
        $('#process_block').append '<div id="messloading">Подождите...</div>'
        return
      success: (data) ->
        console.log data.status
        $('#messloading').remove()
        if data.status == 'errorservice'
          $('#process_block').prepend '<div id="mess" class="ajaxerror"><b>Ошибка:</b> Импортирование завершенно с ошибкой</div>'
        if data.status == 'errorupload'
          $('#process_block').prepend '<div id="mess" class="ajaxerror"><b>Ошибка:</b> Проблема с загрузкой изображений</div>'
        else
          $('#process_block').prepend '<div id="mess" class="ajaxok">Объявление успешно импортированно</div>'
        return
      error: ->
        $('#messloading').remove()
        $('#process_block').prepend '<div id="mess" class="ajaxerror"><b>Ошибка:</b> Сервис временно недоступен</div>'
        return
    return
