const PATH = '/p';

function getMessage(m) {
	let output = document.getElementById('display');
	fetch(`${PATH}/get/${m}`).then(res => {
		if (res.ok) {
			res.json().then(obj => {
				output.innerHTML = (typeof DOMPurify !== "undefined") ? DOMPurify.sanitize(obj.msg) : obj.msg;
			});
		}
	});
}

function sendMessage(m) {
	let secret = m.secret.value;
	let msg = m.msg.value;
	m.reset();
	fetch(`${PATH}/send`, {
		headers: {
			'Accept': 'application/json',
			'Content-Type': 'application/json'
		},
		method: 'POST',
		body: JSON.stringify({secret: secret, msg: msg})
	}).
	then(res => res.json().then(o => o.ok ? alert('cybersent!') : alert('err! :('))).
	catch(err => 0);
}

//function report(m) {
	// TODO: add captcha to avoid spam, spamers are the worse,
	// very bad people, they have bitcoins and other evil stuff.
	// follow the leader leader leader...
	// fetch(`${PATH}/report`, {
	//		headers : {
	//		'Accept' : 'application/json',
	//		'Content-Type' : 'application/json'
	//	},
	//	method: 'POST',
	//	body: JSON.stringify({report: m});
	//}).then().catch();
//}

window.onhashchange = function() {
	let secret = location.hash.slice(1);
	getMessage(secret);
}
