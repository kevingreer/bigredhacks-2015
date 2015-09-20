var textField = document.getElementById("interval");

document.getElementById("button").onclick = function() {
  if(textField.value < 4)
    textField.value = 4;
  chrome.tabs.executeScript(null, {
      code: 'var time = ' + (parseInt(textField.value)*1000) + ';'
  }, function() {
    chrome.tabs.executeScript(null, {file: 'browseraction/scroll.js'});
  });
}
