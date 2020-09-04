// document.addEventListener("turbolinks:load", function(){
    var slideNow = 1;
    var slideInterval = 5000;
    var navBtnId = 0;
    var translateWidth = 0;


    $(document).ready(function() {

        var switchInterval = setInterval(nextSlide, slideInterval);

        $('#home').hover(function() {
            clearInterval(switchInterval);
        }, function() {
            switchInterval = setInterval(nextSlide, slideInterval);
        });

        $('.next-btn').on('click', function() {
            nextSlide();
        });

        $('.prev-btn').on('click', function() {
            prevSlide();
        });

    });


    function nextSlide() {
        if (slideNow == window.slideCount || slideNow <= 0 || slideNow > window.slideCount) {
            $('.sliderwrapper').css('transform', 'translate(0, 0)');
            slideNow = 1;
        } else {
            translateWidth = -$('#home').width() * (slideNow);
            $('.sliderwrapper').css({
                'transform': 'translate(' + translateWidth + 'px, 0)',
                '-webkit-transform': 'translate(' + translateWidth + 'px, 0)',
                '-ms-transform': 'translate(' + translateWidth + 'px, 0)',
            });
            slideNow++;
        }
    }

    function prevSlide() {
        if (slideNow == 1 || slideNow <= 0 || slideNow > window.slideCount) {
            translateWidth = -$('#home').width() * (window.slideCount - 1);
            $('.sliderwrapper').css({
                'transform': 'translate(' + translateWidth + 'px, 0)',
                '-webkit-transform': 'translate(' + translateWidth + 'px, 0)',
                '-ms-transform': 'translate(' + translateWidth + 'px, 0)',
            });
            slideNow = window.slideCount;
        } else {
            translateWidth = -$('#home').width() * (slideNow - window.slideCount);
            $('.sliderwrapper').css({
                'transform': 'translate(' + translateWidth + 'px, 0)',
                '-webkit-transform': 'translate(' + translateWidth + 'px, 0)',
                '-ms-transform': 'translate(' + translateWidth + 'px, 0)',
            });
            slideNow--;
        }
    }
// });


