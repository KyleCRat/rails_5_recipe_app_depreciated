Site.ahht = function() {
    // ahht: Auto Height On Hover Animation

    // hoverActionClass: .ahht-on-hover
    // hoverActionItemClass: .ahht-item

    // This will allow you to animate items from height: 0, display: none to
    //   auto height using GSAP.
    // Add .ahht-on-hover to the parent element you wish to add the mouseover
    //   event bind too.
    // Add .ahht-item to the child element you wish to have animated from
    //   height: 0, display: none to height: auto, display: block.

    hoverAction = $('.ahht-on-hover');
    hoverActionItem = $('.ahht-item');

    $(document).on('mouseenter', '.ahht-on-hover', function(e) {
        if (Foundation.MediaQuery.atLeast('large')) {
            var toTween = $(e.currentTarget).find('.ahht-item');
            var otherTweens = $('.ahht-item').not(toTween)

            if (typeof tlleave == 'object') {
                tlleave.stop();
            }


            tlenter = new TimelineLite();

            tlenter.set(toTween, { display: 'block' });
            tlenter.set(toTween, { height: 'auto' });
            tlenter.from(toTween, 0.5, { height: 0, immediateRender:false });

            tlenter.to(otherTweens, 0.5, { height: 0 }, '-=0.5');
            tlenter.set(otherTweens, { display: 'none' });
        }
    });

    $(document).on('mouseleave', '.ahht-on-hover', function(e) {
        if (Foundation.MediaQuery.atLeast('large')) {
            var toTween = $(e.currentTarget).find('.ahht-item');
            var otherTweens = $('.ahht-item').not(toTween);

            if (typeof tlenter == 'object') {
                tlenter.stop();
            }

            tlleave = new TimelineLite();
            tlleave.set(toTween, { height: toTween.outerHeight() });
            tlleave.to(toTween, 0.5, { height: 0 });
            tlleave.set(toTween, { display: 'none' });
            tlleave.set(toTween, {clearProps: 'all'});

            tlleave.to(otherTweens, 0.5, { height: 0 }, '-=0.5');
            tlleave.set(otherTweens, { display: 'none' });
        }
    });
};
