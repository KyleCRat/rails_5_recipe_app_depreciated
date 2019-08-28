/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

// require jquery3
// require jquery_ujs
// require jquery-ui
// require jquery.remotipart

// require foundation
// require turbolinks
// require cocoon

// require jquery.slick
// require js.cookie
// require maskedinput
// require site

// Require Other JS Libraries
// require countUp
// require nested_form_fields

// Require GSAP animation libraries
// require 'greensock/plugins/CSSPlugin'
// require 'greensock/plugins/ScrollToPlugin'
// require 'greensock/jquery.gsap.js'
// require 'greensock/easing/EasePack'
// require 'greensock/TweenLite'
// require 'greensock/TimelineLite'
// require 'greensock/TweenMax'
// require 'greensock/TimelineMax'

import Rails from 'rails-ujs';
import Turbolinks from 'turbolinks';
import 'foundation-sites';
import 'jquery-ui-dist/jquery-ui.js';
// import JQueryUi from 'jquery-ui-bundle';
import 'slick-carousel';
import TweenLite from "gsap/TweenLite";

Rails.start();
Turbolinks.start();

// Load Javascript Tree
import '../src/site.js';
import '../src/page_slicks.js';
import '../src/page_specific.js';
import '../src/scroll_functions.js';

import '../src/components/nav.js';
import '../src/components/recipe_edit.js';
import '../src/components/ingredients/form_callbacks.js';
import '../src/components/techniques/form_callbacks.js';

import '../src/defaults/auto_height_hover_text.js';
import '../src/defaults/checkbox.js';
import '../src/defaults/file_name_update.js';
import '../src/defaults/flash.js';
import '../src/defaults/slick_animated_gallery.js';
import '../src/defaults/smooth_anchor.js';
import '../src/defaults/video.js';
import '../src/defaults/visible_check.js';

import '../src/scroll/_scroll_checker.js';
import '../src/scroll/hide_nav_on_scroll.js';
import '../src/scroll/paralax_bg.js';
import '../src/scroll/sticky_ingredients.js';



require.context('../src/components');
require.context('../src/defaults');
require.context('../src/scroll');
require.context('../src/settings');
require.context('../src/vendor');

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
        window.scroll_function_array = [];
        Site.session.startTime = Date.now();
        Site.isLoading = false;
        // Site.scrollCheck();
        // Site.nav();
    }

    fireJsInitialized();

    // $(function(){ $(document).foundation(); });

    // Site.closeMenu();
    // Site.videoListeners();
    // Site.scrollFunctions();
    Site.pageSpecificJS();
    // Site.pageSlickSliders();
    // Site.flash();
    // Site.killFlashOnClick();
}

function fireJsInitialized() {
    if (Site.logging) console.log('js:initialized fired');
    var event = document.createEvent('Event');
    event.initEvent('js:initialized', true, true); //can bubble, and is cancellable
    document.dispatchEvent(event);
}

console.log('turbolinks enable test')
document.addEventListener("turbolinks:load", function() {
    console.log('enable');
    Site.session.pagesVisited += 1;
    initialize();
});
