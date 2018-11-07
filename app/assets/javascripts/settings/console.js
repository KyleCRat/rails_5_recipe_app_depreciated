var origLog = console.log;
// TODO: fallbacks if no `defineProperty`...
Object.defineProperty(console, "log", {
  get: function () {
    return Function.prototype.bind.call(origLog, console, yourTimeFormat());
  }
});

var timestampMs = ((window.performance && window.performance.now) ?
                 function() { return window.performance.now(); } :
                 function() { return new Date().getTime(); });
function formatDuration(ms) { return (ms / 1000).toFixed(3) + "s -"; }
var t0 = timestampMs();
function yourTimeFormat() { return formatDuration(timestampMs() - t0); }
