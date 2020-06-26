$( document ).ready(function() {
  habhabUi.sliderInt('.slider-price');
  habhabUi.selectBox('select');
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
              if ( !$(this).hasClass('on') ) {
                  $(this).addClass('on');
                  selectList.slideDown(duration);

                  selectItem.on('click', function() {
                      let chooseItem = $(this).data('value');

                      $('select').val(chooseItem).attr('selected', 'selected');
                      selectHead.text( $(this).find('span').text() );

                      selectList.slideUp(duration);
                      selectHead.removeClass('on');
                  });

              } else {
                  $(this).removeClass('on');
                  selectList.slideUp(duration);
              }
          });
      });
    },
    sliderInt: function(elem) {
        var drag = false;
        var values = [];
            
        $(elem).each(function(i,e){
            updateView(e);
        });

        $(elem+">.bar>.lp, "+elem+">.bar>.rp").on("mousedown", function(){
            drag = $(this);
        })

        $(document).on("mousemove",function(e){
              if(!drag)
              return;
              var x = (e.pageX - $(drag).outerWidth()/2 - $(drag).parent().parent().offset().left)/$(drag).parent().parent().outerWidth();
              if(x < 0 ) x = 0;
              if(x > 1) x = 1;
              var rp = $(drag).parent().find(".rp");
              var lp = $(drag).parent().find(".lp");
              if($(drag).hasClass("lp") && x > $(rp).attr("data-pos") ){
                  $(rp).attr("data-pos",x);
              }
              if($(drag).hasClass("rp") && x < $(lp).attr("data-pos") ){
                  $(lp).attr("data-pos",x);
              }
              $(drag).attr("data-pos",x);
              updateView($(drag).parent().parent());
        });

        $(document).on("mouseup", function(){
            drag = false;
        });

        function updateView(slider){
          var startVal = parseInt($(slider).find(".bar").data("start"));
          var endVal = parseInt($(slider).find(".bar").data("end"));

          if(startVal > endVal)
            endVal = startVal;
            startVal = startVal || 0;
          endVal = endVal || 100;

          var values = [];
          for(var i = startVal; i <= endVal;i++)
            values.push(i);
            var l  =$(slider).find(".lp").attr("data-pos");
            var r  =$(slider).find(".rp").attr("data-pos");
            var max  =$(slider).find(".rp").attr("data-max");
            var proc = max/100;
          var x = $(slider).outerWidth() * l;
          var w = (r - l)*$(slider).outerWidth();

          $(slider).find(".bar").css({left:x+"px",width:w+"px"});
          var index = Math.round(values.length*l);
          if(index >= values.length)
            index = values.length-1;
          $(slider).find(".lp").html("<span>"+values[index]*proc+"</span>");

          index = Math.round(values.length*r);
          if(index >= values.length)
            index = values.length-1;
          $(slider).find(".rp").html("<span>"+values[index]*proc+"</span>");
        }
    }
};

