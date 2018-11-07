///////////////////////////////////////////////////
// This function uses reqeust animation frame
//   to check scroll position of the page to
//   get a smooth and accurate scroll position
///////////////////////////////////////////////////
window.requestAnimationFrame = window.requestAnimationFrame
    || window.mozRequestAnimationFrame
    || window.webkitRequestAnimationFrame
    || window.msRequestAnimationFrame
    || function(f){return setTimeout(f, 1000/60)} // simulate calling code 60

window.cancelAnimationFrame = window.cancelAnimationFrame
    || window.mozCancelAnimationFrame
    || function(requestID){clearTimeout(requestID)} //fall back

window.scrollDirection = 0;
window.scrollVelocity = 0;
window.currentPos = 0;
window.previousPos = 0;
window.timestamp = 0;

Site.scrollCheck = function() {

  var scrollFrame = requestAnimationFrame(function(timestamp) {
    fireScrollFunctions(timestamp);
  });

  var scrollPosFrame = requestAnimationFrame(scrollPos);
}

// RequestAnimationFrame loop
function fireScrollFunctions(timestamp){
  window.timestamp = timestamp || new Date().getTime()

  // While looping on every requestAnimationFrame fire
  //    every associatedscrolling  function that is set
  //    per page in scroll_functions.js
  for(i = 0; i < window.scroll_function_array.length; i++) {
    window.scroll_function_array[i]();
  }

  window.requestAnimationFrame(function(timestamp) {
    fireScrollFunctions(timestamp);
  });
}

// Detect Scrolling position and set window for all functions to use
function scrollPos() {
  setTimeout(function(){ //throttle requestAnimationFrame to window.scrollFPS
    window.currentPos = window.pageYOffset;
    window.scrollVelocity = window.currentPos - window.previousPos;
    window.previousPos = window.currentPos;
    window.requestAnimationFrame(scrollPos);
  }, 1000/window.scrollFPS);
}
