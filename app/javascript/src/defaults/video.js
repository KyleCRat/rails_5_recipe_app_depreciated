Site.video = function() {

    $('.video-element').each(function(index, video) {
        video.controls = true;
        if ($($('.video-element')[index]).hasClass('hide-controls')) {
            video.controls = false;
        }
    });

    $('.video-container').on('click', function(e) {
    video = $(e.currentTarget).find('.video-element')[0];

    if (video.paused || video.ended) {
        video.play();
        video.controls = true;
        $(e.currentTarget).find('.video-play-overlay').hide();
    } else {
        video.pause();
        video.controls = false;
        $(e.currentTarget).find('.video-play-overlay').show();
    }
    });
};

// When a modal is closed, stop playing any videos on the page
$(document).on('closed.zf.reveal', function(e) {

    $('.video-element').each(function(index, video) {
        video.pause();
        video.currentTime = 0;
    });

    if ($(e.currentTarget.activeElement).has('.video-element').length ) {
        $(e.currentTarget.activeElement).find('.video-play-overlay').show();
    }
});

// When a modal is opened, stop playing any videos on the page
// if the modal has a video, play the video on open
$(document).on('open.zf.reveal', function(e) {

    $('.video-element').each(function(index, video) {
        video.pause();
    });

    if ($(e.currentTarget.activeElement).has('.video-element').length ) {
        $(e.currentTarget.activeElement).find('.video-play-overlay').hide();
        $(e.currentTarget.activeElement).find('.video-element')[0].play();
    }
});


Site.videoListeners = function() {
    $('.video-element').on('ended', function(e) {
        $(e.target).load();
        e.target.controls = false;
        $(e.target).parent().find('.video-play-overlay').show();
    });
}
