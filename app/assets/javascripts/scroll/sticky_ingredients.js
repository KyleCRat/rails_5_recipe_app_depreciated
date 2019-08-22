
Site.stickyIngredients = function() {
    offsetX = $('.ingredients').offset().top - 60;
    offsetY = $('.ingredients').offset().left;
    width   = $('.ingredients').outerWidth();

    stickIngredients = function() {
        $('.shopping-list')
            .addClass('sticking')
            .css({
                left: offsetY,
                width: width
            });
    };

    unstickIngredients = function() {
        $('.shopping-list')
            .removeClass('sticking')
            .removeAttr('style');
    };

    if (Foundation.MediaQuery.atLeast('xlarge') &&
        window.outerHeight > $('.shopping-list').outerHeight()  + 200) {
        if (window.scrollY > offsetX) {
            stickIngredients();
        } else if (window.scrollY < offsetX) {
            unstickIngredients();
        }
    } else {
        unstickIngredients();
    }
};
