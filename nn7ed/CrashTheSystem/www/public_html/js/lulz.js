var api = '/api/__method__/';
var publicMethods = ['quote', 'version', 'flag'];
var doQuery = function(method) {
	if (!method in publicMethods) throw new Error("Invalid method");
	var ep = api.replace(/__method__/, method);
	return fetch(ep).then(res => {
		if (res.ok) {
			return res.json();
		}
	});
}
var getQuote = function() {
	doQuery('quote').then(res => {
		if (res.resp) {
			document.getElementById('quote').innerText = res.resp;
		}
	});
}
var getVersion = function() {
	doQuery('version').then(res => {
		if (res.version) {
			document.getElementById('version').innerText = res.version;
		}
	});
}
