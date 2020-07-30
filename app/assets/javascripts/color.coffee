$( document ).ready ()->
  $('.js-colors').on 'click', (e) ->
    item = $(this)
    img1 = item.parents('.car-iteam').find '.car-image'
    img2 = $(".complectation-img")

    color_id = item.attr 'color-id'
    modification_id = item.attr 'modification-id'

    $.ajax
      url: '/modification_images/image'
      type: 'POST'
      dataType: 'json'
      data: modification_image:
        color_id: color_id
        modification_id: modification_id
        original: true
      success: (data) ->
        if img2.find('img').length == 0
          img1.empty().append data["html"]
        else
          img2.fadeOut 100, () ->
            img2.empty().append(data["html"]).fadeIn()

    e.preventDefault()
