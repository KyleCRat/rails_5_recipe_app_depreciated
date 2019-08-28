Site.flash = function() {
    if (window.flashTimeout) {
        clearTimeout(window.flashTimeout);
    }

    window.flashTimeout = window.setTimeout(function(){
        slideUpFlash();
    }, 5000);
};

Site.killFlashOnClick = function() {
    $(document).on('click', '.flash', function() {
        slideUpFlash();
    });
};

var slideUpFlash = function() {
    var height = $('.flash').outerHeight();
    TweenLite.to(
        $('.flash'),
        1,
        {
            y: -height,
            onComplete:destroyFlash
        }
    );
};

var destroyFlash = function() {
    $('.flash').remove();
};
