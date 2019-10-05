const puppeteer = require('puppeteer');

module.exports = {
  visitUrl: visitUrl,
  init: init,
};

let browser, session;

function init(server, port) {
	(async () => {
		console.log('init chrome and log in');
		browser = await puppeteer.launch({executablePath: '/usr/bin/chromium', args: ['--no-sandbox','--disable-gpu-sandbox','--disable-gpu']});
		const page = await browser.newPage();
		try {
			let url = server + ':' + port + '/l0g1nb4ckdoortr1ck1337!';
			await page.goto(url);
			session = await page.cookies();
			console.log('logged in: ');
		} catch(e) {
			console.log('error init');
		}
	})();
}

function close() {
	browser.close();
}

function visitUrl(url) {
	console.log('chrome bot visiting ' + url);
	(async () => {
		const page = await browser.newPage();
		try {
			await page.setCookie(...session);
			await page.goto(url);
			console.log('visited!');
		} catch (e) {
			console.log(e);
		}
	})();
}
