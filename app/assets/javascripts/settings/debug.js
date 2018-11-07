$(document).on('turbolinks:load', function(){
  var width = window.innerWidth;
  var height = window.innerHeight;

  $('#debug-screen-width').html(width + 'px');
  $('#debug-screen-height').html(height + 'px');

  $(window).resize(function() {
    width = window.innerWidth;
    height = window.innerHeight;

    $('#debug-screen-width').html(width + 'px');
    $('#debug-screen-height').html(height + 'px');
  });

  $('#debug-button').click(function(){
    $('#debug').hide();
  });
});
