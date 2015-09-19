
// listening for an event / one-time requests
// coming from the popup
chrome.extension.onMessage.addListener(function(request, sender, sendResponse) {
    startScrolling(request.type);
    return true;
});


// send a message to the content script
var startScrolling = function(interval) {
	chrome.tabs.getSelected(null, function(tab){
	    chrome.tabs.sendMessage(tab.id, {type: interval});
	});
}