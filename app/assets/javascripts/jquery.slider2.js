var slideNow = 1;
var slideCount = $('.mr-slider-wrapper').children().length;
var slideInterval = 5000;
var navBtnId = 0;
var translateWidth = 0;

$(document).ready(function() {

    var switchInterval = setInterval(nextSlide1, slideInterval);

    $('#intro').hover(function() {
        clearInterval(switchInterval);
    }, function() {
        switchInterval = setInterval(nextSlide, slideInterval);
    });


});

function nextSlide1() {
    if (slideNow == slideCount || slideNow <= 0 || slideNow > slideCount) {
        slideNow = 1;
    } else {
        slideNow++;
    }
    getSlide(slideNow);
}

function prevSlide1() {
    if (slideNow == 1 || slideNow <= 0 || slideNow > slideCount) {
        slideNow = slideCount;
    } else {
        slideNow--;
    }
    getSlide2(slideNow);
}

function getSlide(slideNow) {
    $('.mr-slider-wrapper .mr-slider-slide').removeClass('selected');
    $('.mr-slider-wrapper .mr-slider-slide').removeClass('unselected');
    var li = $('.mr-slider-wrapper .mr-slider-slide:first-child').addClass('selected'); // parent of the button
    li.insertAfter('.mr-slider-wrapper > .mr-slider-slide:last-child');
    console.log();
}

function getSlide2(slideNow) {
    $('.mr-slider-wrapper .mr-slider-slide').removeClass('selected');
    $('.mr-slider-wrapper .mr-slider-slide').removeClass('unselected');
    var li = $('.mr-slider-wrapper .mr-slider-slide:last-child').addClass('unselected'); // parent of the button
    li.insertBefore('.mr-slider-wrapper > .mr-slider-slide:first-child');
    console.log();
}

function OrderSand(obj) {
    var msg = $(obj).serialize();
    console.log(msg);
    $(obj).on("ajax:beforeSend", function() {
        $(obj).find('.buttonA').attr('disabled', true).val('Отправка...').addClass("sended");
    }).on("ajax:success", function(data) {
        $(obj).find('.buttonA').attr('disabled', true).val('Успешно отправлено!').addClass("sended"); 
    }).on("ajax:error", function(xhr, str) {
        $(obj).find('.buttonA').attr('disabled', true).val('Ошибка отправки').addClass("error"); 
    })
    return false;
}