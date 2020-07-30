$( document ).ready ()->
  $('.parse-model').on 'ajax:beforeSend', () ->
    o = $(this).parents('.control-panel-parser')
    o.find('.ok').hide();
    o.find('.status').show();
  $('.parse-model').on 'ajax:complete', () ->
    o = $(this).parents('.control-panel-parser')
    o.find('.status').hide();
    o.find('.ok').show();