Site.paralaxPreviousRun = 0; // Reset global previous run variable
Site.paralaxBG = function() {
  $('.paralax-bg').each(function() { // For each instance of class .paralx-bg on the page
    paralaxBGAnimate($(this)); // Call the Animate Function
  });
}

// Animation function for the paralax background image
function paralaxBGAnimate(section) {
  //Set variables
  var inView = isScrolledIntoPartialView(section), // Check if the section is within the window
      previousRun = Site.paralaxPreviousRun,
      currentRun = window.timestamp,
      pfps = 1000/window.paralaxFPS, // Get the FPS to run the animation at
      delay = (currentRun - previousRun) > pfps,
      paralaxSection =            section, // The section containing the paralax bg
      paralaxSectionImg =         paralaxSection.find('.paralax-bg-img') // The paralax bg img iteself
      windowHeight =              $(window).height(), // Get the height of the browser window
      paralaxContainerHeight =    $(paralaxSection).height(), // Get the height of the containing section
      bgImgHeight =               $(paralaxSectionImg).height(), // Get the height of the image
      topMax =                    bgImgHeight - paralaxContainerHeight;
  // If the section being paralaxed does not already have a transform on it
  //   Set the transform y to the top max variable, so the paralaxing starts
  //   at the correct position
  if($(paralaxSectionImg).prop("style")['transform'] == '') {
    // console.log('set paralax to inital transform');
    TweenLite.to(paralaxSectionImg, 0, {y:topMax});
  }
  // If the delay between the previous run and the time now is greater than the
  //   specified FPS to run at AND the section is within the view port AND
  //   the window is at leaset of the large breakpoint do the actual animatoin
  //   calculation
  if(delay && inView && Foundation.MediaQuery.atLeast('large')) {
    // Find the ratio of the image height to the window height, and set the paralax
    //   start point and end point, as well as the distance the frame will travel.
    var frameOffsetYStart =         $(paralaxSection).offset().top - windowHeight,
        frameOffsetYEnd =           $(paralaxSection).offset().top + paralaxContainerHeight,
        frameDistance =             frameOffsetYEnd - frameOffsetYStart;
    // Calculate how far the image should be offset depending on the current scroll
    //   distance while the section is viewable.
    //   window.paralaxAnimationSpeed is a global variable used to set the time
    //   the paralx animation will take to complete (in seconds)
    paralaxOffsetBottom = (frameOffsetYEnd - window.pageYOffset) * (topMax / frameDistance);
    TweenLite.to(paralaxSectionImg, window.paralaxAnimationSpeed, {y:paralaxOffsetBottom});
    Site.paralaxPreviousRun = currentRun;
  }
}
