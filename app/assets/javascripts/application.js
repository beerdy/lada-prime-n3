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

 
  function getURLVar(key) {
    var query = String(document.location.href).split('?');
    if (query[1]) {
      var part = query[1].split('&');
      for (i = 0; i < part.length; i++) {
        var data = part[i].split('=');
        if (data[0] == key && data[1]) return data[1];
      }
    }
    return '';
  }

  function pageTo(page){
    var p = $("#"+page);
    var offset = p.offset();
    console.log(offset.top);
    $("html, body").animate({
            scrollTop: offset.top-100+"px"
        }, 1000);

    return false;
  }

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
      $('#send-message-wait').hide();
      $('#send-message-ok').hide();
      $('#send-message-error').hide();
      $('#send-message-data').show();
    });

    $('.popupClose').on('click', function() {
        $('.popupBg').fadeOut();
    });

    $('div.superPuper').each(function (index, value) { 
       var deadline = $(this).attr('time');
       initializeClock(deadline, this); 
       console.log(this);
    });

  function getTimeRemaining(endtime){
    console.log(endtime);
    var t = Date.parse(endtime) - Date.parse(new Date());
    console.log(new Date());
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
    var timeinterval = setInterval(updateClock, 1000, obj);
  }
  if($('.kuzov').length){
    var url_string = window.location.href.split('/');
      if(url_string[4] && url_string[4]!=""){
        console.log('Модель указана');
        $('.model .new-select').text($('.new-select__item[data-value="/models/'+url_string[4]+'/"] span').text());
      }else{
        $('.kuzov').addClass('invisible');
      }
  } 

  if($('.modification').length){
    var url_string = window.location.href.split('/');
      if(url_string[6] && url_string[6]!=""){
        console.log('Модификация указана'); 
        $('.kuzov .new-select').text($('.new-select__item[data-value="/models/'+url_string[4]+'/modifications/'+url_string[6]+'/"] span').text());
      }else{
        $('.modification').addClass('invisible');
      }
  } 

  var url_string = window.location.href

  $('.click .new-select__item').on('click', function() { 
      var link = $(this).attr('data-value');
      if(link){
        document.location.href = link;
        console.log(link);
      }
  });

    $('.clickjs .new-select__item').on('click', function() {
      $('.car-iteam').hide(); 
      var link = $(this).attr('data-value');
      console.log(link);
      if(link){
          $('.car-iteam[complect="'+link+'"]').show();
      }
  });
  
});

 

// });