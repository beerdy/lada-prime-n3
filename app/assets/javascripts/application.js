// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.

//= require jquery3
//= require jquery_ujs
//= require jquery-ui
// require rails-ujs
// require turbolinks
//= require_tree .
// document.addEventListener("turbolinks:load", function(){

  function pageTo(page){
    var p = $("#"+page);
    var offset = p.offset();
    console.log(offset.top);
    $("html, body").animate({
            scrollTop: offset.top-100+"px"
        }, 1000);

    return false;
  }

  $(window).scroll(function(){
    var p = $("#home");
    var offset = p.offset();

        if ($(this).scrollTop() > offset.top/1.5) {
            $('.buttonUp').addClass('yes');
        } else {
            $('.buttonUp').removeClass('yes');
        }

        if ($(this).scrollTop() > 50) {
            $('.header').addClass('small');
        } else {
            $('.header').removeClass('small');
        }
  });

  function bigMenu(it){
    console.log('OpenMenu');
    $('.bigMenu').toggleClass('active');
    $('.menuiBlock').toggleClass('active');
    return false;
  }

  function bigMenu(it){
    console.log('OpenMenu');
    $('.bigMenu').toggleClass('active');
    $('.menuiBlock').toggleClass('active');
    return false;
  }
  
$(document).ready(function() {

    $('.popupOpen').on('click', function() {
        $('.popupBg').fadeIn();
    });

    $('.popupClose').on('click', function() {
        $('.popupBg').fadeOut();
    });


    console.log('Все работает. а саша дурак');

    $('div.superPuper').each(function (index, value) { 
       var deadline = $(this).attr('time');
       initializeClock(deadline, this); 
       console.log(this);
    });

  function getTimeRemaining(endtime){
    var t = Date.parse(endtime) - Date.parse(new Date());
    var seconds = Math.floor( (t/1000) % 60 );
    var minutes = Math.floor( (t/1000/60) % 60 );
    var hours = Math.floor( (t/(1000*60*60)) % 24 );
    var days = Math.floor( t/(1000*60*60*24) );
    return {
     'total': t,
     'days': days,
     'hours': hours,
     'minutes': minutes,
     'seconds': seconds
    };
  }

  function initializeClock(endtime, obj){
    console.log('Все работает. а саша дурак');
    var clock = $('.countdown');

      function updateClock(obj){
        var t = getTimeRemaining(endtime);
        $(obj).find('.countdown .days span').html(t.days);
        $(obj).find('.countdown .hours span').html(t.hours);
        $(obj).find('.countdown .minutes span').html(t.minutes);
        $(obj).find('.countdown .seconds span').html(t.seconds);
        if(t.total<=0){
         clearInterval(timeinterval);
        }
    }

    updateClock(obj); // запустите функцию один раз, чтобы избежать задержки
    var timeinterval = setInterval(updateClock,1000, obj);
  }
  });


// });