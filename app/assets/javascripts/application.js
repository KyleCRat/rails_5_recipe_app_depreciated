// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery-ui
//= require jquery_ujs

//= require foundation
//= require turbolinks

//= require jquery.slick
//= require js.cookie
//= require maskedinput
//= require site

// Require Other JS Libraries
// require countUp
//= require nested_form_fields

// Require GSAP animation libraries
//= require 'greensock/plugins/CSSPlugin'
//= require 'greensock/plugins/ScrollToPlugin'
//= require 'greensock/jquery.gsap.js'
//= require 'greensock/easing/EasePack'
//= require 'greensock/TweenLite'
//= require 'greensock/TimelineLite'
// require 'greensock/TweenMax'
// require 'greensock/TimelineMax'

// get the rest of the js tree
//= require_tree .

if (Site.logging) console.log('Site Loaded at: '+ new Date().getTime());

///////////////////////////////////////////////////
// Global Watchers
///////////////////////////////////////////////////

// When closing an ajax revealed modal destroy it
$(document).on('closed.zf.reveal', '.ajax-reveal', function(e) {
    window.setTimeout(function(){
        $(e.target).foundation('destroy').remove();
    }, 50);
});

///////////////////////////////////////////////////
// Initialize all window variable arrays
///////////////////////////////////////////////////
// Set how many times the scroll is checked per second for animation triggers
window.scrollFPS = 20;

// Set how many fps the paralax function runs at
//  NOTE: this does not affect the fps of the animation, just how many
//        times a second the code will check for page movement
window.paralaxFPS = 60;
// Time in seconds of how long the transform takes to complete when a scroll
//    is detected
window.paralaxAnimationSpeed = 0.05;


///////////////////////////////////////////////////
// All javascript that fires per page will be in
//   the initalize function, it fires once on site
//   load and once per page change
///////////////////////////////////////////////////
function initialize() {

    if (Site.logging) console.log('initialize -> Fired');

    // Fire only on inital site load
    if (Site.isLoading) {
        Site.session.startTime = Date.now();
        Site.isLoading = false;
        Site.scrollCheck();
    }

    fireJsInitialized();

    $(function(){ $(document).foundation(); });

    Site.videoListeners();
    Site.scrollFunctions();
    Site.pageSpecificJS();
    Site.pageSlickSliders();
}

function fireJsInitialized() {
    if (Site.logging) console.log('js:initialized fired');
    var event = document.createEvent('Event');
    event.initEvent('js:initialized', true, true); //can bubble, and is cancellable
    document.dispatchEvent(event);
}

document.addEventListener("turbolinks:load", function() {
    Site.session.pagesVisited += 1;
    initialize();
});
