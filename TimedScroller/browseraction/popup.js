var textField = document.getElementById("interval");

document.getElementById("button").onclick = function() {
  if(textField.value < 4)
    textField.value = 4;
  
  var mstime = parseInt(textField.value);
  console.log("swag");

  chrome.tabs.executeScript(null, {
      code: 'var time = ' + (mstime*1000) + ';'
  }, function() {
    chrome.tabs.executeScript(null, {file: 'browseraction/scroll.js'});
  });
}
