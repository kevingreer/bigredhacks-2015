var textField = document.getElementById("interval");
var ID;
document.getElementById("button").onclick = function() {
  if(textField.value < 4)
    textField.value = 4;
  chrome.tabs.executeScript(null, {
      code: 'var time = ' + (parseInt(textField.value)*1000) + '; var stop = false;'
  }, function() {
    chrome.tabs.executeScript(null, {file: 'browseraction/scroll.js'});
  });
}

document.getElementById("stop").onclick = function() {
	clearInterval(ID);
}
