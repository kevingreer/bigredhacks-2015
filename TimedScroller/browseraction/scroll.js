var getCurrentScrollHeight = function() {
  return document.body.scrollTop
}

var smoothScroll = function(distance, duration) { //duration in milliseconds
  var STEP_SIZE = 1;
  var endY = getCurrentScrollHeight() + distance;
  var steps = distance/STEP_SIZE;
  var incTime = duration/steps;

  // If the current position is less than the end position, scroll by the step
  // size every time interval. Otherwise, scroll to the end position and stop 
  // the timer.
  var timer = setInterval( function () {
    var currentY = getCurrentScrollHeight();
    if (currentY < endY) {
      window.scrollBy(0, STEP_SIZE);
    } else {
      window.scrollTo(0, endY);
      clearInterval(timer);
    }
  }, incTime);
}

setInterval( function() { 
  smoothScroll(window.innerHeight - 100, 100);
}, time);