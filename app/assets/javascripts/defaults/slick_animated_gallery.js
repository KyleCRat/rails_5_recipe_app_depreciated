// Add .slick-animated-gallery, and fade: true to any slick slider to enable
//   animated slide changes

Site.slickAnimatedGallery = function() {
    $('.slick-animated-gallery').on('beforeChange', function(event, slick, currentSlide, nextSlide){

        currentSlide = $($('.slick-animated-gallery .slick-slide')[currentSlide]);
        nextSlide = $($('.slick-animated-gallery .slick-slide')[nextSlide]);

        currentSlideHeight = currentSlide.height();
        nextSlideHeight = nextSlide.height();

        thisFadeOutLeft = currentSlide.find('img:first-child');
        thisFadeOutRight = currentSlide.find('img:last-child');
        nextFadeInLeft = nextSlide.find('img:first-child');
        nextFadeInRight = nextSlide.find('img:last-child');

        tl = new TimelineLite();
        tl.set(nextSlide, { height: nextSlideHeight });
        tl.set(currentSlide, { height: currentSlideHeight });

        tl.set([nextFadeInLeft, nextFadeInRight], { position: 'absolute' });
        tl.set(nextFadeInLeft, { left: -200, opacity: 0 });
        tl.set(nextFadeInRight, { right: -200, opacity: 0 });
        tl.set([thisFadeOutLeft, thisFadeOutRight], { position: 'absolute' });

        tl.to(thisFadeOutLeft, 1.45, { left: -200, opacity: 0 });
        tl.to(thisFadeOutRight, 1.65, { right: -200, opacity: 0 }, '-=1.25');

        tl.to(nextFadeInLeft, 1.65, { left: 0, opacity: 1, position: 'relative' }, '-=1.45');
        tl.to(nextFadeInRight, 1.25, { right: 0, opacity: 1, position: 'relative' }, '-=1.25');

        tl.set([thisFadeOutLeft, thisFadeOutRight, nextFadeInRight, nextFadeInLeft], { clearProps: 'all' }, '+=0.6');
        tl.set([currentSlide, nextSlide], { clearProps: 'height' });
    });
};
