///////////////////////////////////////////////////
// Site is the global function object
//   used to keep things organized and safe to
//   call while using turbolinks
///////////////////////////////////////////////////
window.Site = {
    page: {
    },
    session: {
      pagesVisited: 1,
      startTime: null,
      endTime: null
    },
    logging: true,
    loadErrorCount: 0,
    isLoading: true   // Set the inital load state of the site
};
