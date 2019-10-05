const express = require('express')
const app = express()
const bodyParser = require('body-parser')
const admin = require('./build/Release/admin.node');
const fs = require('fs');
const crypto = require('crypto');

const port = process.env.PORT || 3000;

app.get('/api/:method', function (req, res) {
    res.setHeader('Content-Type', 'application/json');
	switch (req.params.method) {
		case 'quote':
			res.send(JSON.stringify({ resp: getRandomQuote() }));
			break;
		case 'version':
			res.send(JSON.stringify({ version: 'version 1.0.1 (free)' }));
			break;
		case 'flag':
			res.send(JSON.stringify({ ayquemelol: 'nn17ed{xDDD sure sure...}' }));
			break;
		default:
			res.send(JSON.stringify({ error: "method not supported" }));
    } 
});

app.post('/admin/'+admin.SECRET_PATH, bodyParser.json(), function (req, res) {
    res.setHeader('Content-Type', 'application/json');
	if (admin.authenticate(req.body.user, req.body.pass)) {
		res.send(JSON.stringify({ flag: fs.readFileSync('fl4g.txt', 'utf8') }));
		process.exit(0);
		return;
	} else {
		res.send(JSON.stringify({ error: "fuck off!" }));
	}
});

function getRandomQuote () {
    const quotes = ["Jerry get out of the booth, take all your clothes off, and fold yourself 12 times.","Bummed I didn't get ti give that insect dick a try.","He's a spy, blow him up. I'm gonna go take a shit.","Ohh yea, you gotta get schwifty.","He's not pressing charges... That's gotta be the you shot me equivalent of not being mad.","Get off the high road Summer. We all got pink eye because you wouldn't stop texting on the toilet.","He's a real piece of shit.","I'm not looking for judgement, just a yes or no. Can you assimilate a giraffe?","We need a hang glider, and a crotch less uncle sam costume, and I want the entire field of your largest stadium covered end to end with naked red heads, and I want the stands packed with every man that remotely resembles my father.","Yea... If you spend all day shuffling words around you can make anything sound bad... Morty..","Like nothing shady ever happened in a fully furnished office? You ever hear about Wall Street Morty? You know what those guys do in their fancy board rooms? They take their balls and dip 'em in cocaine and wipe 'em all over each other. You know Grandpa goes around and he does his business in public because grandpa isn't shady.","There is no god, in your face! One dot muthafucka!","Not today bitch!","That guy is the Red Grin Grumbold of pretending he knows what's going on... Oh you agree huh? You like that Red Grin Grumbold reference? Well guess what, I made him up. You really are your father's children. Think for yourselves, don't be sheep.","Yo! What up my glip glops!","Then it's time to get your beak wet tonight playa!","It's like the N word and the C word had a baby, and it was raised by all the bad words for Jews.","Don't break an arm jerking yourself off Morty.","25 shmeckles? I-I-I-I don't even know what that- what is that? Is that a lot?","ALLAH BLEHHHH AKBAR","Me irresponsible?? All I wanted was for you to hand me a screwdriver! But instead you had me buckle down and...make you a...roofie...juice serum, so you can roofie that poor girl at your school. W-w-w-w--are you kidding me, Morty?! You're really gonna try to take the high road on this one?? Y'know your-you're a little creep, Morty! Your-your-your-you're just a little creepy creep person!!","I don't like it here Morty. I can't abide bureaucracy. I don't like being told where to go and what to do. I consider it a violation. Did you get those seeds all the way up your butt?","I don't think we can perform our new song, The Recipe For Concentrated Dark Matter for a crowd this tiny!","I'm sorry, Morty. It's a bummer. In reality you're as dumb as they come.","'I'm sorry Summer, your opinion means very little to me.'","ISN'T IT OBVIOUS MORTY? I FROZE HIM.","Its a device Morty, that when you put it in your ear, you can enter people's dreams Morty. Its just like that movie that you keep crowing about.","It's a figure of speech, Morty! They're bureaucrats! I don't respect them. Just keep shooting, Morty! You have no idea what prison is like here!","its fine, everythings is fine. theres an infinite number of realities morty, and in a few dozens of those i got lucky and turned everything back to normal","its not like we can do this every week, we get 3 or 4 more of these tops","Lemme hear everybody say hey-yo! All the ladies say yeaaah! Everybody over thirty do this with your hand! Everybody with a red shirt jump up and down! Yo, everyone whose first name begins with an L who isn't hispanic, walk in a circle the same number of times as the square root of your age times teeenn!","Listen, Morty, I hate to break it to you but what people call love is just a chemical reaction that compels animals to breed.","Puffy vagina","Morty, can you get to the left nipple?","Not for the men they cheat on."];
    return quotes[(Math.random() * (quotes.length-1)) | 0];
}

app.use(express.static(__dirname + '/public_html'));

// ONLY FOR DEVELOPMENT!
app.use(function (err, req, res, next) {
	let corePattern = crypto.createHash('sha1').update(+Date.now()+[]).digest('hex').slice(0,8);
	fs.writeFileSync('core.to', corePattern);
	err.message += `(dbg: core.${corePattern})`
	next(err);
	throw err;
});

app.listen(port, function () {
    console.log('listening!')
});
