// Function that checks which page we are on and then
//   puts the approperiate animations in an array
Site.scrollFunctions = function() {

  //Empty scroll_function_array on nav click
  $(document).on('turbolinks:visit', function(){
    window.scroll_function_array = [];
  });

  //Set scroll_function_array based on url
  var url = window.location.pathname;

  switch(url) { //Page specfic Animations && Javascript
    case '/':
      window.scroll_function_array = [
        //Site.exampleFunction
      ];
      break;
    default: // Set the scroll_function_array on any page not specified above
      window.scroll_function_array = [];
  }
  //Global Animations
  window.scroll_function_array.push(
    //Site.exampleGlobalFunction
  );
}
