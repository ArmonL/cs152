"Adventure" by "Hansen Wu"

When play begins: say "Hello World. You wake up, but something doesn't feel right. You quickly get out of bed. Where is everyone? You should probably check the time."

[A thing can be examined or unexamined. A thing is usually unexamined. After examining something: now the noun is examined; continue the action.]
[A thing can be examined or unexamined. A thing is unexamined. After examining something: now the noun is examined.]

The Home is a room. "It's gray and dull in here. Bright sunlight pours in through the window."

The watch is in the Home. Description is "[if player is in home]You check your watch. Oh no, you woke up far too late! Good thing there's still time to get to school. Speaking of which, school is to the west.[otherwise]You're far behind schedule, better get moving!"

The laptop is in the Home. Description is "[if player is in home and player does not have laptop]Your laptop is lying around. [end if]Ten pounds of Linux! This is where the Cyber™ happens. [if player is in Cyber Room] A few terminal windows are tiled to the screen corners, with green text flows across them. Since when did you use green text? Something tells you that Cyber™ is happening."

The charger is in the Home. Description is "[if player is in home and player does not have charger]Your laptop charger is lying around. Don't forget to take it with you![otherwise]Good thing you brought your laptop charger."

[Every turn:
	If the watch is unexamined:
		Instead of going west:
			say "Why would you go to school right now?... Wait, what time is it? You should check your watch first.";]

[Instead of going west:
	say "Shouldn't you get oriented first?";]

Every turn:
	If player is in Home:
		if player does not have watch:
			say "You feel a lack of grasp on the time. Where's your watch?";
		if player does not have laptop:
			say "Your backpack feels unusually light.";
		if player does not have charger:
			say "Something doesn't feel right.";
	If player is in SJSU:
		if player does not have laptop or player does not have charger:
			say "You feel unprepared."
	[Otherwise:]


The SJSU is a room. Description is "[if unvisited]You arrive at school, dodging potholes, debris, and terrible drivers on the road. The sun's already up and people are out and about. You lock your bike in the bike cage and quickly head to MacQuarrie Hall. This is [end if]SJSU, a college in Silicon Valley with a long history, stuck in the middle of downtown San Jose. You should go to the CS Club and get some work done before class starts." The SJSU is west of the Home.

Every turn:
	If player is in SJSU:
		Instead of going east:
			say "You can't go home, there's so much to get done!";

The staircase is a door. It is above the SJSU and below the Clubroom. "The staircase leads [if player is in SJSU]up to the clubroom on the second floor.[otherwise]to the first floor and the rest of SJSU."

Instead of climbing the staircase: 
	try entering the staircase.


The Clubroom is a room. Description is "This is the CS club room. CS stuff happens here. You should take out your laptop and get working. [if unvisited]Strange, where is everyone?[end if]"

Every turn: 
	If player is in Clubroom:
		if laptop is in Home:
			end the story saying "A sinking feeling washes over you. Where's your laptop?! Unfortunately you can't get anything done today.";
		if laptop is in Clubroom:
			say "Alright, let's get cracking! You open up your laptop and get started, going through the boot sequence and typing in passwords.";
			if charger is in Home:
				end the story saying "... Only to notice that the battery is low, and you forgot your charger at home. A sinking feeling washes over you. Unfortunately you can't get anything done today.";
			if player has charger:
				say "You plug in your laptop to charge it up. But what's this? The clubroom's door slams shut, and metal shielding covers the windows. The room goes dark, sirens blare, and red lights flash. You're in the cyber Room! Your laptop screen flashes the text 'SHALL WE PLAY A GAME' before disappearing, and a big red security button appears beside you.";
				move laptop to Cyber Room;
				move player to Cyber Room;


The Cyber Room is a room. Description is "The room is dark, there's flashing lights, and electronic music is playing. Is this Def Con? A sign above the door says 'Cyber Room'. Evidently, the Cyber™ happens here."

Security Button is in Cyber Room. Description is "Big, red, with block letters saying 'SECURITY' on it. Push for security to happen. Or Cyber™. Something like that, pick the buzzword of your choice."

Robot Fox is an animal in the Cyber Room. "Robot Fox yaps mechanically." Description is "Robot Fox, a 100% non-organic silver fox with blue fur accents. It looks cute, although it'll probably shred your Planet Express uniforms. It stares back at you quizzically, and tilts its head."

Instead of pushing Security Button:
	end the story saying "You push the button and ... nothing happens. 'They're in the kernel!' a voice shouts, and you find yourself jolted awake in class. Huh, you weren't in a Cyber Room, you just fell asleep in class";
