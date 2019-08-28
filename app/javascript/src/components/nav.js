Site.nav = function() {
    var html = $('html'),
        mainNav = $('.main-nav'),
        openClass = 'nav-open';

    $(document).on('click', '.action-toggle-main-nav', function() {
        if (html.hasClass(openClass)) {
            Site.closeMenu();
        } else {
            Site.openMenu();
        }
    });
};

Site.closeMenu = function() {
    $('html').removeClass('nav-open');
}

Site.openMenu = function() {
    $('html').addClass('nav-open');
};
