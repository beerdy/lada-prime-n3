$( document ).ready(function() {

  $('#sashazaebal').imageview();


  var mrgallery = {
    open: function(href){
      $('body').append('<div class="MrGallery animated fadeIn" onclick="$(this).remove();"><div class="ImgOpened animated jackInTheBox" style="background-image:url(\''+href+'\');"></div></div>')
      return false;
    },
   close: function(e){
      $(e).remove();
      return false;
    }
  }

  $(".tradein-filters").on("click", function(e) {
       $(this).toggleClass("show");
  });

  habhabUi.selectBox('select');

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

  $("#filter__range").slider({
    min: document.priceMin,
    max: document.priceMax,
    values: [document.nowPriceMin, document.nowPriceMax],
    range: true,
    stop: function(event, ui) {
      $("input#priceMin").val($("#filter__range").slider("values",0));
      $("input#priceMax").val($("#filter__range").slider("values",1));

      $('.price-range-min.value').html($("#filter__range").slider("values",0).toLocaleString()+"&nbsp;₽");
      $('.price-range-max.value').html($("#filter__range").slider("values",1).toLocaleString()+"&nbsp;₽");

      document.location.href = document.location.pathname+'?pricemin='+$("#filter__range").slider("values",0)+'&pricemax='+$("#filter__range").slider("values",1);
    },
    slide: function(event, ui){
      $("input#priceMin").val($("#filter__range").slider("values",0));
      $("input#priceMax").val($("#filter__range").slider("values",1));

      $('.price-range-min.value').html($("#filter__range").slider("values",0).toLocaleString()+"&nbsp;₽");
      $('.price-range-max.value').html($("#filter__range").slider("values",1).toLocaleString()+"&nbsp;₽");
    }
  });


  $('#filter__range .ui-slider-handle:eq(0)').append('<span class="price-range-min value">' + $('#filter__range').slider('values', 0 ).toLocaleString()+"&nbsp;г"+ '</span>');
  $('#filter__range .ui-slider-handle:eq(1)').append('<span class="price-range-max value">' + $('#filter__range').slider('values', 1 ).toLocaleString() +"&nbsp;г"+ '</span>');
  
  document.priceMin = parseInt($("#filter__range_price").attr('pricemin'));
  document.priceMax = parseInt($("#filter__range_price").attr('pricemax'));

  if(getURLVar('pricemin') != ""){
    document.nowpriceMin = parseInt(getURLVar('pricemin'));
  }else{
    document.nowpriceMin = document.priceMin;
  }
  if(getURLVar('pricemax') != ""){
    document.nowpriceMax = parseInt(getURLVar('pricemax'));
  }else{
    document.nowpriceMax = document.priceMax;
  }

  $("#filter__range_price").slider({
    min: document.priceMin,
    max: document.priceMax,
    values: [document.nowpriceMin, document.nowpriceMax],
    range: true,
    stop: function(event, ui) {
      $("input#priceMin").val($("#filter__range_price").slider("values",0));
      $("input#priceMax").val($("#filter__range_price").slider("values",1));

      $('.price-range-min.value').html($("#filter__range_price").slider("values",0).toLocaleString()+"&nbsp;₽");
      $('.price-range-max.value').html($("#filter__range_price").slider("values",1).toLocaleString()+"&nbsp;₽");

    },
    slide: function(event, ui){
      $("input#priceMin").val($("#filter__range_price").slider("values",0));
      $("input#priceMax").val($("#filter__range_price").slider("values",1));

      $('.price-range-min.value').html($("#filter__range_price").slider("values",0).toLocaleString()+"&nbsp;₽");
      $('.price-range-max.value').html($("#filter__range_price").slider("values",1).toLocaleString()+"&nbsp;₽");
    }
  });

  $('#filter__range_price .ui-slider-handle:eq(0)').append('<span class="price-range-min value">' + $('#filter__range_price').slider('values', 0 ).toLocaleString()+"&nbsp;₽"+ '</span>');
  $('#filter__range_price .ui-slider-handle:eq(1)').append('<span class="price-range-max value">' + $('#filter__range_price').slider('values', 1 ).toLocaleString() +"&nbsp;₽"+ '</span>');
  

  document.yearMin = parseInt($("#filter__range_year").attr('yearmin'));
  document.yearMax = parseInt($("#filter__range_year").attr('yearmax'));

  if(getURLVar('yearmin') != ""){
    document.nowYearMin = parseInt(getURLVar('yearmin'));
  }else{
    document.nowYearMin = document.yearMin;
  }
  if(getURLVar('yearmax') != ""){
    document.nowYearMax = parseInt(getURLVar('yearmax'));
  }else{
    document.nowYearMax = document.yearMax;
  }

  $("#filter__range_year").slider({
    min: document.yearMin,
    max: document.yearMax,
    values: [document.nowYearMin, document.nowYearMax],
    range: true,
    stop: function(event, ui) {
      $("input#yearMin").val($("#filter__range_year").slider("values",0));
      $("input#yearMax").val($("#filter__range_year").slider("values",1));

      $('.year-range-min.value').html($("#filter__range_year").slider("values",0).toLocaleString()+"&nbsp;₽");
      $('.year-range-max.value').html($("#filter__range_year").slider("values",1).toLocaleString()+"&nbsp;₽");

    },
    slide: function(event, ui){
      $("input#priceMin").val($("#filter__range_year").slider("values",0));
      $("input#priceMax").val($("#filter__range_year").slider("values",1));

      $('.year-range-min.value').html($("#filter__range_year").slider("values",0).toLocaleString()+"&nbsp;₽");
      $('.year-range-max.value').html($("#filter__range_year").slider("values",1).toLocaleString()+"&nbsp;₽");
    }
  });

  $('#filter__range_year .ui-slider-handle:eq(0)').append('<span class="year-range-min value">' + $('#filter__range_year').slider('values', 0 ).toLocaleString()+"&nbsp;₽"+ '</span>');
  $('#filter__range_year .ui-slider-handle:eq(1)').append('<span class="year-range-max value">' + $('#filter__range_year').slider('values', 1 ).toLocaleString() +"&nbsp;₽"+ '</span>');



  document.kmMin = parseInt($("#filter__range_km").attr('kmmin'));
  document.kmMax = parseInt($("#filter__range_km").attr('kmmax'));

  if(getURLVar('kmmin') != ""){
    document.nowkmMin = parseInt(getURLVar('kmmin'));
  }else{
    document.nowkmMin = document.kmMin;
  }
  if(getURLVar('kmmax') != ""){
    document.nowkmMax = parseInt(getURLVar('kmmax'));
  }else{
    document.nowkmMax = document.kmMax;
  }

  $("#filter__range_km").slider({
    min: document.kmMin,
    max: document.kmMax,
    values: [document.nowkmMin, document.nowkmMax],
    range: true,
    stop: function(event, ui) {
      $("input#kmMin").val($("#filter__range_km").slider("values",0));
      $("input#kmMax").val($("#filter__range_km").slider("values",1));

      $('.km-range-min.value').html($("#filter__range_km").slider("values",0).toLocaleString()+"&nbsp;₽");
      $('.km-range-max.value').html($("#filter__range_km").slider("values",1).toLocaleString()+"&nbsp;₽");

    },
    slide: function(event, ui){
      $("input#priceMin").val($("#filter__range_km").slider("values",0));
      $("input#priceMax").val($("#filter__range_km").slider("values",1));

      $('.km-range-min.value').html($("#filter__range_km").slider("values",0).toLocaleString()+"&nbsp;₽");
      $('.km-range-max.value').html($("#filter__range_km").slider("values",1).toLocaleString()+"&nbsp;₽");
    }
  });

  $('#filter__range_km .ui-slider-handle:eq(0)').append('<span class="km-range-min value">' + $('#filter__range_km').slider('values', 0 ).toLocaleString()+"&nbsp;₽"+ '</span>');
  $('#filter__range_km .ui-slider-handle:eq(1)').append('<span class="km-range-max value">' + $('#filter__range_km').slider('values', 1 ).toLocaleString() +"&nbsp;₽"+ '</span>');
  

  document.dviMin = parseInt($("#filter__range_dvi").attr('dvimin'));
  document.dviMax = parseInt($("#filter__range_dvi").attr('dvimax'));

  if(getURLVar('dvimin') != ""){
    document.nowdviMin = parseInt(getURLVar('dvimin'));
  }else{
    document.nowdviMin = document.dviMin;
  }
  if(getURLVar('dvimax') != ""){
    document.nowdviMax = parseInt(getURLVar('dvimax'));
  }else{
    document.nowdviMax = document.dviMax;
  }

  $("#filter__range_dvi").slider({
    min: document.dviMin,
    max: document.dviMax,
    values: [document.nowdviMin, document.nowdviMax],
    range: true,
    stop: function(event, ui) {
      $("input#dviMin").val($("#filter__range_dvi").slider("values",0));
      $("input#dviMax").val($("#filter__range_dvi").slider("values",1));

      $('.dvi-range-min.value').html($("#filter__range_dvi").slider("values",0).toLocaleString()+"&nbsp;₽");
      $('.dvi-range-max.value').html($("#filter__range_dvi").slider("values",1).toLocaleString()+"&nbsp;₽");

    },
    slide: function(event, ui){
      $("input#priceMin").val($("#filter__range_dvi").slider("values",0));
      $("input#priceMax").val($("#filter__range_dvi").slider("values",1));

      $('.dvi-range-min.value').html($("#filter__range_dvi").slider("values",0).toLocaleString()+"&nbsp;₽");
      $('.dvi-range-max.value').html($("#filter__range_dvi").slider("values",1).toLocaleString()+"&nbsp;₽");
    }
  });

  $('#filter__range_dvi .ui-slider-handle:eq(0)').append('<span class="dvi-range-min value">' + $('#filter__range_dvi').slider('values', 0 ).toLocaleString()+"&nbsp;₽"+ '</span>');
  $('#filter__range_dvi .ui-slider-handle:eq(1)').append('<span class="dvi-range-max value">' + $('#filter__range_dvi').slider('values', 1 ).toLocaleString() +"&nbsp;₽"+ '</span>');
  

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


