window.onload = function() {
	document.getElementById("button").onclick = function() {
		chrome.tabs.executeScript(null, {file: "browseraction/scroll.js"});
	}
}