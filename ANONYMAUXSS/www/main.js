const express = require('express');
const app = express();
const bodyParser = require('body-parser');
const cookieParser = require('cookie-parser');
const puppeteer = require('puppeteer');
const fs = require('fs');
const { URL } = require('url');

const port = process.env.PORT || 3001;

const db = {};

app.use(function(req, res, next) {
    res.setHeader('Content-Type', 'application/json');
	res.setHeader('Access-Control-Allow-Origin', '*');
	res.setHeader('Access-Control-Allow-Headers', 'Origin, X-Requested-With, Content-Type, Accept');
	res.setHeader('Access-Control-Allow-Methods', 'GET,POST');
	if ('OPTIONS' == req.method) {
		res.sendStatus(200);
		return;
	}
	next();
});

app.get('/get', function (req, res) {
	res.send(JSON.stringify({ err: "intergalatic private violation. your punishment is coming." }));
});

app.get('/get/:secret', function (req, res) {
	let secret = req.params.secret;
	if (db.hasOwnProperty(secret)) {
		res.send(JSON.stringify({ msg: db[secret] }));
		delete db[secret];
	} else {
		res.send(JSON.stringify({ msg: '(empty)' }));
	}
});

app.post('/send', bodyParser.json(), function (req, res) {
	let secret = req.body.secret, msg = req.body.msg;
	if (secret && msg && typeof(secret) == 'string' && typeof(msg) == 'string' && !db.hasOwnProperty(secret)) {
		db[secret] = msg;
		res.send(JSON.stringify({ ok: true }));
		return;
	}
	res.send(JSON.stringify({ ok: false }));
});

app.post('/report', bodyParser.json(), function (req, res) {
	let report = req.body.report;
	if (typeof(report) == 'string') {
		res.send(JSON.stringify({ ret: 'thank you, flanders. your report is being processed... ' }));
		(async () => {
			await processReport(report);
		})()
	} else {
		res.send(JSON.stringify({ err: true }));
	}
});

app.get('/admin', cookieParser(), function (req, res) {
	// check authentication and return flag
    res.setHeader('Content-Type', 'text/html;charset=utf-8');
    res.setHeader('X-Content-Type-Options', 'nosniff'); 
	if (req.cookies.XSuperSecretCustomToken === 'an3mabuscarLab0ladedr4anemabuscarlaboladedracc..') {
		res.status(200);
		res.send('<!doctype html>\n<html><head><title>Admin</title></head><body><pre>Welcome sir... ' + fs.readFileSync('fl4g.txt', 'utf8') + '</pre></body></html>');
	} else {
		res.sendStatus(401);
	}
});

app.get('*', function (req, res) {
	res.redirect('/');
});

app.listen(port, function () {
    console.log('listening!')
});

async function processReport(msg) {
	let urls = msg.split(' ').map(s => {
		try {
			return new URL(s);
		} catch (e) {}
	});
	urls = urls.filter(u => (u && (u.protocol == 'http:' || u.protocol == 'https:')));
	if (urls.length == 0) return;
	let visit = urls[0].href;
	console.log("visiting " + visit + "...");
	// remove args in server with new kernel
	const browser = await puppeteer.launch({args: ['--no-sandbox', '--disable-setuid-sandbox']});
	const page = await browser.newPage();
	await page.setCookie({
			name : 'XSuperSecretCustomToken',
			value : 'an3mabuscarLab0ladedr4anemabuscarlaboladedracc..',
			domain : 'nn7ed.ka0labs.org:9999',
			path : '/admin/',
			httpOnly : true,
	});
	await page.goto(visit, {waitUntil: 'networkidle', timeout: 5000});
	await browser.close();
}
