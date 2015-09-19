window.onload = function() {
	document.getElementById("button").onclick = function() {
		console.log(document.getElementById("interval").value);
		//chrome.tabs.executeScript(null, {file: "browseraction/scroll.js"});
		/*chrome.tabs.executeScript(null, {
   			 code: 'var time = parseInt(document.getElementById("interval").value);'
		}, function() {
    		chrome.tabs.executeScript(null, {file: 'browseraction/scroll.js'});
		});*/
	}
}