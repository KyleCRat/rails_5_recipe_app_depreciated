// Function that checks which page we are on and then
//   puts the approperiate animations in an array
Site.scrollFunctions = function() {

    //Empty scroll_function_array on nav click
    $(document).on('turbolinks:visit', function(){
        window.scroll_function_array = [];
    });

    //Set scroll_function_array based on url
    var url = window.location.pathname;
    var baseURL = url.split('/')[1];

    switch(baseURL) { //All pages behind path
        case 'recipes':
            window.scroll_function_array = [
                Site.stickyIngredients
            ];
            break;
    }

    switch(url) { //Page specfic Animations && Javascript
        case '/':
            window.scroll_function_array.push(
                // Site.exampleFunction
            );
            break;
        default: // Set the scroll_function_array on any page not specified above
            window.scroll_function_array.push(
                //Site.exampleFunction
            );
            break;
    }

    //Global Animations
    window.scroll_function_array.push(
        Site.hideNavOnScroll
    );
};
