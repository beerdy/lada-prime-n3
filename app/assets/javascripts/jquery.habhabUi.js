$( document ).ready(function() {
  habhabUi.selectBox('select');

  document.priceMin = parseInt($("#filter__range").attr('pricemin'));
  document.priceMax = parseInt($("#filter__range").attr('pricemax'));

  if(getURLVar('pricemin') != ""){
    document.nowPriceMin = parseInt(getURLVar('pricemin'));
  }else{
    document.nowPriceMin = document.priceMin;
  }
  if(getURLVar('pricemax') != ""){
    document.nowPriceMax = parseInt(getURLVar('pricemax'));
  }else{
    document.nowPriceMax = document.priceMax;
  }

  if(getURLVar('pricesort') == "min"){
    $('.orderby').addClass('min');
  }else{
    $('.orderby').addClass('max');
  }

  $('.orderby').on('click', function(){

    var sort = 'min';

    if(getURLVar('pricesort') == "min"){
      sort = 'max';
    }

    if(getURLVar('pricemin') == ""){
        document.location.href = document.location.pathname+'?pricesort='+sort;
    }else{
        document.location.href = document.location.pathname+'?pricemin='+getURLVar('pricemin')+'&pricemax='+getURLVar('pricemax')+'&pricesort='+sort;
    }

  });


  $("#filter__range").slider({
    min: document.priceMin,
    max: document.priceMax,
    values: [document.nowPriceMin, document.nowPriceMax],
    range: true,
    stop: function(event, ui) {
      $("input#priceMin").val($("#filter__range").slider("values",0));
      $("input#priceMax").val($("#filter__range").slider("values",1));

      $('.price-range-min.value').html($("#filter__range").slider("values",0));
      $('.price-range-max.value').html($("#filter__range").slider("values",1));

      document.location.href = document.location.pathname+'?pricemin='+$("#filter__range").slider("values",0)+'&pricemax='+$("#filter__range").slider("values",1);
      console.log(document.location.pathname);

    },
    slide: function(event, ui){
      $("input#priceMin").val($("#filter__range").slider("values",0));
      $("input#priceMax").val($("#filter__range").slider("values",1));

      $('.price-range-min.value').html($("#filter__range").slider("values",0));
      $('.price-range-max.value').html($("#filter__range").slider("values",1));
    }
  });

  $('.ui-slider-handle:eq(0)').append('<span class="price-range-min value">' + $('#filter__range').slider('values', 0 ) + '</span>');
  $('.ui-slider-handle:eq(1)').append('<span class="price-range-max value">' + $('#filter__range').slider('values', 1 ) + '</span>');

});

var habhabUi = {
    selectBox: function(elem) {
      $(elem).each(function() {
          const _this = $(this),
              selectOption = _this.find('option'),
              selectOptionLength = selectOption.length,
              selectedOption = selectOption.filter(':selected'),
              duration = 350; // длительность анимации 

          _this.hide();
          _this.wrap('<div class="select"></div>');
          $('<div>', {
              class: 'new-select',
              text: _this.children('option:disabled').text()
          }).insertAfter(_this);

          const selectHead = _this.next('.new-select');
          $('<div>', {
              class: 'new-select__list'
          }).insertAfter(selectHead);

          const selectList = selectHead.next('.new-select__list');
          for (let i = 1; i < selectOptionLength; i++) {
              $('<div>', {
                  class: 'new-select__item',
                  html: $('<span>', {
                      text: selectOption.eq(i).text()
                  })
              })
              .attr('data-value', selectOption.eq(i).val())
              .appendTo(selectList);
          }

          const selectItem = selectList.find('.new-select__item');
          selectList.slideUp(0);
          selectHead.on('click', function() {
              if ( !$(this).parent('.select').hasClass('on') ) {
                  $(this).parent('.select').addClass('on');
                  selectList.slideDown(duration);

                  selectItem.on('click', function() {
                      let chooseItem = $(this).data('value');

                      $('select').val(chooseItem).attr('selected', 'selected');
                      selectHead.text( $(this).find('span').text() );

                      selectList.slideUp(duration);
                      selectHead.removeClass('on');
                  });

              } else {
                  $(this).parent('.select').removeClass('on');
                  selectList.slideUp(duration);
              }
          });
      });
    }
};


