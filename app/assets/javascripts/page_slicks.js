Site.pageSlickSliders = function() {
  if (Site.logging) console.log('pageSlickSliders -> Fired')
  initSlickByClass();
}

//Take each slider ID from the slick_sliders_array and do
function initSlickByClass() {
  //Initialize the slider
  if (!$('.is-slick').hasClass('slick-initialized')) {
    $('.is-slick').slick().fadeTo(350, 1)
  }

  //set a turbolinks watcher to unslick it and fade it out when the page changes
  $(document).on('turbolinks:request-start', function() {
    $('.is-slick').slick('unslick').fadeTo(0,0);
  });
}
