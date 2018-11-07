// this function checks which page we are on and fires any
//   javascript that needs to be fired for just that page
//   or group of pages under a sub page

Site.pageSpecificJS = function() {
  //Set scroll_function_array based on url
  var url = window.location.pathname;
  var baseURL = url.split('/')[1]

  //Page specfic Animations && Javascript for url
  // Be sure to have leading '/'
  switch(url) {
    case '/':
      //Site.exampleUrlFunction();
      break;
  }

  //Page specfic javascript for all sub pages of the baseURL
  // Remove the leading '/'
  switch(baseURL) {
    case 'page':
      //Site.examplePageFunction();
      break;
  }
}
