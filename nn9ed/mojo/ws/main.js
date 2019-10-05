const crypto = require('crypto');
const WebSocketServer = require('ws').Server;
const vm = require('vm');

const port = process.env.PORT || 7070;
const secret = (key) => ((key == 1337) ? process.env.FLAG : 'fail');
const wss = new WebSocketServer({ port: port });

wss.on('connection', function connection(ws) {
	const sandbox = {[crypto.randomBytes(32).toString('hex')] : secret};
    ws.on('message', function incoming(message) {
		console.log(message);
		if (message.match(/^[a-z.()]+$/)) {
			try {
				let resp = vm.runInNewContext(message, sandbox, {timeout: 1000});
				ws.send(JSON.stringify({response: String(resp)}));
			} catch(e) {
				ws.send(JSON.stringify({error: 'runtime error'}));
			}
		} else {
			ws.send(JSON.stringify({error: 'noob'}));
		}
    });
});
