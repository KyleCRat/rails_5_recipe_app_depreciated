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
//= require jquery3
//= require jquery_ujs
//= require jquery-ui
//= require jquery.remotipart

//= require foundation
//= require turbolinks
//= require cocoon
//= require rails.validations
//= require rails.validations.simple_form

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

// after closing an ajax revealed modal, destroy it
$(document).on('closed.zf.reveal', '.ajax-reveal', function(e) {
    window.setTimeout(function(){
        $(e.target).foundation('destroy').remove();
    }, 50);
});

// Whenever cocoon inserts a form element, re-enable client_side_validations
//   javascript method on the parent form.
$(document).on('cocoon:after-insert', function(e, insertedItem, originalEvent) {
    console.log('re-init CSV');
    insertedItem.closest("form").enableClientSideValidations();
});

// recipe_step[stepable_attributes][step_ingredients_attributes][1567318630472][ingredient_attributes][title]
// recipe_step[stepable_attributes][step_ingredients_attributes][new_step_ingredients][ingredient_attributes][title]

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
        window.scroll_function_array = [];
        Site.session.startTime = Date.now();
        Site.isLoading = false;
        Site.scrollCheck();
        Site.nav();
    }

    fireJsInitialized();

    $(function(){ $(document).foundation(); });

    Site.closeMenu();
    Site.videoListeners();
    Site.scrollFunctions();
    Site.pageSpecificJS();
    Site.pageSlickSliders();
    Site.flash();
    Site.killFlashOnClick();
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
