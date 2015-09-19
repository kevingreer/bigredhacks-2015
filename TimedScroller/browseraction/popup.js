document.getElementById("button").onclick = function() {
	//chrome.tabs.executeScript(null, {file: "browseraction/scroll.js"});
	chrome.tabs.executeScript(null, {code: 'var time = 1000;'}, function() {chrome.tabs.executeScript(null, {file: 'browseraction/scroll.js'});});
}
