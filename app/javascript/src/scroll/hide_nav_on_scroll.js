Site.hideNavOnScroll = function() {
    var showVelocity = -50,
        hideVelocity = 25;

    hideNav = function() {
        $('.site-nav').addClass('scroll-hide');
    };

    showNav = function() {
        $('.site-nav').removeClass('scroll-hide');
    };

    if (window.scrollVelocity > hideVelocity && !$('.site-nav').hasClass('scroll-hide')) {
        hideNav();
    } else if (window.scrollVelocity < showVelocity && $('.site-nav').hasClass('scroll-hide')) {
        showNav();
    }
};
