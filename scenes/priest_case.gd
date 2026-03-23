extends Node2D

var ALIGNMENT = 0

@export var DL: dialogue
@export var ANBG: animatedBg
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#await confessional()
	#await where_first()
	#await interviews()
	#await rat_chase()
	await rat_wait()
	await bakery()
	if ALIGNMENT > 0:
		await law_ending()
	else:
		await faith_ending()
	

func confessional():
	#SETUP
	ANBG.swap_bg(ANBG.bg_index.confess1)
	ANBG.set_anim(ANBG.anim_index.confess1, 3)
	ANBG.loop_anim(3, 0.43)
	
	#DIALOGUE START
	DL.show()
	DL.swap_name("Father Sidney")
	DL.swap_dialogue("You may start, child.")
	DL.prog_text()
	await DL.advance_text
	
	DL.swap_name("???")
	DL.swap_dialogue("Bless me father for I have sinned.")
	DL.prog_text()
	await DL.advance_text
	DL.swap_name("Father Sidney")
	DL.swap_dialogue("And your sin?")
	DL.prog_text()
	await DL.advance_text
	
	DL.swap_name("???")
	DL.swap_dialogue("I am the reason Minister Raisor is no longer with us.")
	DL.prog_text()
	await DL.advance_text
	DL.swap_name("Father Sidney")
	DL.swap_dialogue("Excuse me-?", true)
	await DL.prog_text()
	
	DL.swap_name("???")
	DL.swap_dialogue("-No let me try that again.",true)
	DL.prog_text()
	
	await get_tree().create_timer(3).timeout
	DL.swap_dialogue("I killed him.")
	DL.prog_text()
	await DL.advance_text
	
	DL.swap_name("Father Sidney")
	DL.swap_dialogue("I... I'm not sure I can absolve this crime, my child-", true)
	DL.prog_text()
	
	DL.swap_name("???")
	DL.swap_dialogue("My intent was not malice, and you need not stay professional father.")
	DL.prog_text()
	await DL.advance_text 
	
	DL.swap_name("Father Sidney")
	DL.swap_dialogue("This defeats the purpose I know... but what is your name-?", true)
	await DL.prog_text()
	
	DL.swap_name("???")
	DL.swap_dialogue("You understand the rough patch Sandstone has had this year, Sidney. More than anyone.")
	DL.prog_text()
	await DL.advance_text 
	
	DL.swap_name("Father Sidney")
	DL.swap_dialogue("Can you stop interrupting me, Who are you-", true)
	await DL.prog_text()
	
	DL.swap_name("???")
	DL.swap_dialogue("Bless me father for I have sinned.")
	DL.prog_text()
	await DL.advance_text
	
	DL.swap_name("Father Sidney")
	DL.swap_dialogue("What?", true)
	await DL.prog_text()
	DL.swap_name("???")
	DL.swap_dialogue("I am the reason Minister Raisor is no longer with us.", true)
	await DL.prog_text()
	
	DL.swap_name("Father Sidney")
	DL.swap_dialogue("That's it, I'm opening the curtain.", true)
	await DL.prog_text()
	DL.swap_name("???")
	DL.swap_dialogue("-No let me try that again.",true)
	DL.prog_text()
	await DL.advance_text
	
	#newloop	
	ANBG.end_anim()
	await ANBG.anim_looped
	ANBG.swap_bg(ANBG.bg_index.confess2)
	ANBG.set_anim(ANBG.anim_index.confess2, 3)
	ANBG.loop_anim(2, 0.43)
	
	DL.swap_dialogue("I killed him.")
	DL.prog_text()
	await DL.advance_text
	
	DL.swap_name("Father Sidney")
	DL.swap_dialogue("A mannequin and a tape recorder. I really fell for that.")
	DL.prog_text()
	ANBG.end_anim()
	await ANBG.anim_looped
	ANBG.set_anim(ANBG.anim_index.confess2, 3)
	await ANBG.play_anim_once(3, 0.43)
	await DL.advance_text
	
	#END
	DL.hide()
	ANBG.anim_state(false)

func where_first():
	
	#SETUP
	DL.hide()
	ANBG.swap_bg(ANBG.bg_index.cafe_morning)
	ANBG.set_anim(ANBG.anim_index.show_taperec, 3)
	await ANBG.play_anim_once(3, 0.43)
	
	#DIALOGUE START
	DL.show()
	DL.swap_name("Roman")
	DL.swap_dialogue("That's why you wanted to meet?")
	DL.prog_text()
	await DL.advance_text
	ANBG.set_anim(ANBG.anim_index.cafe_speak, 3)
	ANBG.loop_anim(3, 0.43)
	DL.swap_name("Father Sidney")
	DL.swap_dialogue("More or less.")
	DL.prog_text()
	await DL.advance_text
	DL.swap_name("Roman")
	DL.swap_dialogue("Sorry, I just can't believe it. I trust you, obviously.")
	DL.prog_text()
	await DL.advance_text
	DL.swap_dialogue("But he died of a heart attack. There's nothing to investigate")
	DL.prog_text()
	await DL.advance_text
	DL.swap_dialogue("Some hoodlum just dropped it off to freak you out.")
	DL.prog_text()
	await DL.advance_text
	DL.swap_name("Father Sidney")
	DL.swap_dialogue("That's the thing though.")
	DL.prog_text()
	await DL.advance_text
	DL.swap_dialogue("This isn't a random tape recorder. 'Some hoodlum' doesn't just have Raisor's personal one.")
	DL.prog_text()
	await DL.advance_text
	DL.swap_dialogue("He carried it everywhere. But it disappeared before the paramedics got to him.")
	DL.prog_text()
	await DL.advance_text
	DL.swap_name("Roman")
	DL.swap_dialogue("From what I remember he still had his jewellery at the scene, right?")
	DL.prog_text()
	await DL.advance_text
	DL.swap_dialogue("So you're thinking he wasn't stolen from by a civilian when he died.")
	DL.prog_text()
	await DL.advance_text
	DL.swap_name("Father Sidney")
	DL.swap_dialogue("Absolutely.", true)
	await DL.prog_text()
	
	DL.swap_dialogue("It's a trophy.")
	DL.prog_text()
	await DL.advance_text
	DL.swap_name("Roman")
	DL.swap_dialogue("But, again. Heart attack. No common poisons were found in his blood.")
	DL.prog_text()
	await DL.advance_text
	DL.swap_dialogue("I know. But there was no further investigation at all.")
	DL.prog_text()
	await DL.advance_text
	DL.swap_dialogue("We need to at least attempt a thorough one, like old times! Before I left for the church.")
	DL.prog_text()
	await DL.advance_text
	DL.swap_name("Roman")
	DL.swap_dialogue("Alright then, if you're as sharp as you used to be,")
	DL.prog_text()
	await DL.advance_text

	DL.swap_dialogue("Why don't you pick where we go first?")
	DL.prog_text()
	await DL.advance_text
	
	

func interviews():
	
	DL.create_choices("We should talk to his old roommate, Mary Produe.", "The Coroner could tell us a lot more about how he died.")
	var leave_for = await DL.get_choice()
	if leave_for == 0: #aptment
		ALIGNMENT -= 1
		DL.swap_name("Roman")
		DL.swap_dialogue("Smart, if the victim has no spouse, the first to talk to is usually the neighbour.")
		DL.prog_text()
		await DL.advance_text
		DL.swap_dialogue("And who's a closer neighbour than his roommate.")
		DL.prog_text()
		await DL.advance_text
		DL.swap_name("Father Sidney")
		DL.swap_dialogue("If we leave now, we'll get there just as the sun rises.")
		DL.prog_text()
		await DL.advance_text
		DL.swap_name("Roman")
		DL.swap_dialogue("But we haven't even ordered anything to drink yet!")
		DL.prog_text()
		await DL.advance_text
		DL.swap_name("Father Sidney")
		DL.swap_dialogue("It's 6:21am, nobody lives here anymore, and the waiter is probably asleep in that closet.")
		DL.prog_text()
		await DL.advance_text
		DL.swap_dialogue("We'd be waiting a long while. Come on! Let's go!")
		DL.prog_text()
		await DL.advance_text
		
		###go
		ANBG.end_anim()
		await ANBG.anim_looped
		ANBG.swap_bg(ANBG.bg_index.spouse_path)
		ANBG.set_anim(ANBG.anim_index.spouse_talk, 5)
		ANBG.loop_anim(5, 0.43)
		
		DL.swap_name("Mary")
		DL.swap_dialogue("Been a while, hasn't it? Who's the friend Sid'?")
		DL.prog_text()
		await DL.advance_text
		ANBG.end_anim()
		await ANBG.anim_looped
		ANBG.set_anim(ANBG.anim_index.spouse_idle, 5)
		ANBG.loop_anim(5, 0.43)
		DL.swap_name("Father Sidney")
		DL.swap_dialogue("Oh, he's my partner from my old job. We'd like to ask a few questions.")
		DL.prog_text()
		await DL.advance_text
		ANBG.end_anim()
		await ANBG.anim_looped
		ANBG.set_anim(ANBG.anim_index.spouse_talk, 5)
		ANBG.loop_anim(5, 0.43)
		DL.swap_name("Mary")
		DL.swap_dialogue("I see, I thought everythin' was good up in Saint K's?")
		DL.prog_text()
		await DL.advance_text
		ANBG.end_anim()
		await ANBG.anim_looped
		ANBG.set_anim(ANBG.anim_index.spouse_idle, 5)
		ANBG.loop_anim(5, 0.43)
		DL.swap_name("Father Sidney")
		DL.swap_dialogue("Yeah, we did recover from the incident. But that's what we're here to talk about.")
		DL.prog_text()
		await DL.advance_text
		DL.swap_name("Roman")
		DL.swap_dialogue("Miss, did Minister Raisor ever tell you of any medical issues he may have had?")
		DL.prog_text()
		await DL.advance_text
		
		ANBG.end_anim()
		await ANBG.anim_looped
		ANBG.set_anim(ANBG.anim_index.spouse_talk, 5)
		ANBG.loop_anim(5, 0.43)
		DL.swap_name("Mary")
		DL.swap_dialogue("Well, 'is old man also fell from a heart attack, auntie too.")
		DL.prog_text()
		await DL.advance_text
		ANBG.end_anim()
		await ANBG.anim_looped
		ANBG.set_anim(ANBG.anim_index.spouse_idle, 5)
		ANBG.loop_anim(5, 0.43)
		
		DL.swap_name("Roman")
		DL.swap_dialogue("Thanks. Remember, a family history of heart issues can be exploited Sidney.")
		DL.prog_text()
		await DL.advance_text
		ANBG.end_anim()
		await ANBG.anim_looped
		
		DL.indicating_blocked = true
		ANBG.set_anim(ANBG.anim_index.spouse_window, 12)
		await ANBG.play_anim_once(12, 0.18)
		DL.indicating_blocked = false
		ANBG.set_anim(ANBG.anim_index.spouse_idle, 5)
		ANBG.loop_anim(5, 0.43)
		
		DL.swap_name("Father Sidney")
		DL.swap_dialogue("Right! like in 2004, that case with the doctor who gave her patients clotting agents on purpose.")
		DL.prog_text()
		await DL.advance_text
		
		ANBG.end_anim()
		await ANBG.anim_looped
		ANBG.set_anim(ANBG.anim_index.spouse_talk, 5)
		ANBG.loop_anim(5, 0.43)
		DL.swap_name("Mary")
		DL.swap_dialogue("I did always warn 'im that all those salted bagels he ate were gonna kill 'im one day...")
		DL.prog_text()
		await DL.advance_text
		ANBG.end_anim()
		await ANBG.anim_looped
		ANBG.set_anim(ANBG.anim_index.spouse_idle, 5)
		ANBG.loop_anim(5, 0.43)
		DL.swap_name("Roman")
		DL.swap_dialogue("We understand it was a few months ago, but where were you around the time he died?")
		DL.prog_text()
		await DL.advance_text
		DL.swap_name("Father Sidney")
		DL.swap_dialogue("She was in Montreal that week if I remember.", true)
		await DL.prog_text()
		
		DL.swap_name("Roman")
		DL.swap_dialogue("Let her answer the question.")
		DL.prog_text()
		await DL.advance_text
		
		ANBG.end_anim()
		await ANBG.anim_looped
		ANBG.set_anim(ANBG.anim_index.spouse_talk, 5)
		ANBG.loop_anim(5, 0.43)
		DL.swap_name("Mary")
		DL.swap_dialogue("No no, Sid's right, I was outta town, but I was in Toronto.")
		DL.prog_text()
		await DL.advance_text
		
		DL.swap_dialogue("...At a concert with Jacob, soon as I 'eard the news I got in my car. Headed west.")
		DL.prog_text()
		await DL.advance_text
		
		DL.swap_dialogue("Straight west. Back home. Here.")
		DL.prog_text()
		await DL.advance_text
		DL.swap_dialogue("Listened to his cassettes for longer than I want to admit.")
		DL.prog_text()
		await DL.advance_text
		DL.swap_dialogue("Did they ever find his recorder Sid'? In the church or anythin'? It wasn't in his room.")
		DL.prog_text()
		await DL.advance_text
		
		ANBG.end_anim()
		await ANBG.anim_looped
		ANBG.swap_bg(ANBG.bg_index.drain)
		ANBG.set_anim(ANBG.anim_index.drain_drop, 5)
		DL.swap_name("15 Minutes Ago")
		DL.swap_dialogue("On the walk to the apartment...", true)
		await DL.prog_text()
		
		DL.swap_name("Roman")
		DL.swap_dialogue("Can you stop playing with the evidence? You WILL drop it.")
		DL.prog_text()
		await DL.advance_text
		DL.swap_name("Father Sidney")
		DL.swap_dialogue("What? You never used to fiddle with your cassettes?")
		DL.prog_text()
		await DL.advance_text
		DL.swap_dialogue("I'm basically a pro by now, do you know how boring it is to sit and listen in that box?")
		DL.prog_text()
		await DL.advance_text
		DL.swap_dialogue("See? I can balance it on my nos-", true)
		await DL.prog_text()
		await ANBG.play_anim_once(5, 0.12)
		
		ANBG.swap_bg(ANBG.bg_index.spouse_path)
		ANBG.set_anim(ANBG.anim_index.spouse_idle, 5)
		ANBG.loop_anim(5, 0.43)
		
		DL.swap_name("Father Sidney")
		DL.swap_dialogue("We uh... never found it, sorry.")
		DL.prog_text()
		await DL.advance_text
		
		ANBG.end_anim()
		await ANBG.anim_looped
		ANBG.set_anim(ANBG.anim_index.spouse_talk, 5)
		ANBG.loop_anim(5, 0.43)
		DL.swap_name("Mary")
		DL.swap_dialogue("A real shame that is, anythin' else you need to know?")
		DL.prog_text()
		await DL.advance_text
		ANBG.end_anim()
		await ANBG.anim_looped
		ANBG.set_anim(ANBG.anim_index.spouse_idle, 5)
		ANBG.loop_anim(5, 0.43)
		DL.swap_name("Father Sidney")
		DL.swap_dialogue("Any idea where he might've gotten those bagels?")
		DL.prog_text()
		await DL.advance_text
		ANBG.end_anim()
		await ANBG.anim_looped
		ANBG.set_anim(ANBG.anim_index.spouse_talk, 5)
		ANBG.loop_anim(5, 0.43)
		DL.swap_name("Mary")
		DL.swap_dialogue("He was always trying new bakeries, but there was never a favorite.")
		DL.prog_text()
		await DL.advance_text
		ANBG.end_anim()
		await ANBG.anim_looped
		ANBG.set_anim(ANBG.anim_index.spouse_idle, 5)
		ANBG.loop_anim(5, 0.43)
		DL.swap_name("Roman")
		DL.swap_dialogue("Thank you anyways miss. We'll be leaving now.")
		DL.prog_text()
		await DL.advance_text
		
	elif leave_for == 1: #coroner
		ALIGNMENT += 1
		DL.swap_name("Roman")
		DL.swap_dialogue("Sure, the heart attack is a very key point so far.")
		DL.prog_text()
		await DL.advance_text
		DL.swap_dialogue("I think it was Lisa Edel who examined the body, at Sandstone General. Good friend of mine.")
		DL.prog_text()
		await DL.advance_text
		DL.swap_name("Father Sidney")
		DL.swap_dialogue("If we leave now, we'll get there just as the sun rises.")
		DL.prog_text()
		await DL.advance_text
		DL.swap_name("Roman")
		DL.swap_dialogue("But we haven't even ordered anything to drink yet!")
		DL.prog_text()
		await DL.advance_text
		DL.swap_name("Father Sidney")
		DL.swap_dialogue("It's 6:21am, nobody lives here anymore, and the waiter is probably asleep in that closet.")
		DL.prog_text()
		await DL.advance_text
		DL.swap_dialogue("We'd be waiting a long while. Come on! Let's go!")
		DL.prog_text()
		await DL.advance_text
		
		###go
		ANBG.end_anim()
		await ANBG.anim_looped
		ANBG.swap_bg(ANBG.bg_index.lab_path)
		ANBG.set_anim(ANBG.anim_index.lab_talk, 6)
		ANBG.loop_anim(6, 0.43)
		
		DL.swap_name("Doctor Edel")
		DL.swap_dialogue("P.I Roman, good to see you again. Any developments on the case about the man with the twisted lip?")
		DL.prog_text()
		await DL.advance_text
		ANBG.end_anim()
		await ANBG.anim_looped
		ANBG.set_anim(ANBG.anim_index.lab_idle, 6)
		ANBG.loop_anim(6, 0.43)
		DL.swap_name("Roman")
		DL.swap_dialogue("We can discuss that over lunch next month when I'm done. We're here about Raisor.")
		DL.prog_text()
		await DL.advance_text
		ANBG.end_anim()
		await ANBG.anim_looped
		ANBG.set_anim(ANBG.anim_index.lab_talk, 6)
		ANBG.loop_anim(6, 0.43)
		DL.swap_name("Doctor Edel")
		DL.swap_dialogue("Minister Raisor? For what purpose?")
		DL.prog_text()
		await DL.advance_text
		ANBG.end_anim()
		await ANBG.anim_looped
		ANBG.set_anim(ANBG.anim_index.lab_idle, 6)
		ANBG.loop_anim(6, 0.43)
		DL.swap_name("Father Sidney")
		DL.swap_dialogue("We believe someone intentionally caused him to have a heart attack, somehow.")
		DL.prog_text()
		await DL.advance_text
		DL.swap_name("Roman")
		DL.swap_dialogue("You have his medical records, yes?")
		DL.prog_text()
		await DL.advance_text
		
		ANBG.end_anim()
		await ANBG.anim_looped
		ANBG.set_anim(ANBG.anim_index.lab_talk, 6)
		ANBG.loop_anim(6, 0.43)
		DL.swap_name("Doctor Edel")
		DL.swap_dialogue("Of course, I can't print you a copy obviously.")
		DL.prog_text()
		await DL.advance_text
		DL.swap_dialogue("But I can tell you two some details, as you are extentions of law enforcement.")
		DL.prog_text()
		await DL.advance_text
		ANBG.end_anim()
		await ANBG.anim_looped
		ANBG.set_anim(ANBG.anim_index.lab_idle, 6)
		ANBG.loop_anim(6, 0.43)
		
		DL.swap_name("Father Sidney")
		DL.swap_dialogue("Well actually I'm still kind of a prie-", true)
		await DL.prog_text()
		
		DL.swap_name("Roman")
		DL.swap_dialogue("Sidney, your experience as an Eye lets you be a temporary consultant at any time. It's fine.")
		DL.prog_text()
		await DL.advance_text
		
		ANBG.end_anim()
		await ANBG.anim_looped
		ANBG.set_anim(ANBG.anim_index.lab_talk, 6)
		ANBG.loop_anim(6, 0.43)
		DL.swap_name("Doctor Edel")
		DL.swap_dialogue("Hm. You must be rusty if you forgot that.")
		DL.prog_text()
		await DL.advance_text
		DL.swap_dialogue("Now. Raisor.")
		DL.prog_text()
		await DL.advance_text
		DL.swap_dialogue("His father and aunt both died of heart attacks.")
		DL.prog_text()
		await DL.advance_text
		ANBG.end_anim()
		await ANBG.anim_looped
		ANBG.set_anim(ANBG.anim_index.lab_idle, 6)
		ANBG.loop_anim(6, 0.43)
		
		DL.swap_name("Roman")
		DL.swap_dialogue("Thanks. Remember, a family history of heart issues can be exploited Sidney.")
		DL.prog_text()
		await DL.advance_text
		
		DL.swap_name("Father Sidney")
		DL.swap_dialogue("Right! like in 2004, that case with the doctor who gave her patients clotting agents on purpose.")
		DL.prog_text()
		await DL.advance_text
		
		ANBG.end_anim()
		await ANBG.anim_looped
		ANBG.set_anim(ANBG.anim_index.lab_talk, 6)
		ANBG.loop_anim(6, 0.43)
		DL.swap_name("Doctor Edel")
		DL.swap_dialogue("Yes, Doctor Nadia. Really did not like her. Glad shes in jail.")
		DL.prog_text()
		await DL.advance_text
		ANBG.end_anim()
		await ANBG.anim_looped
		ANBG.set_anim(ANBG.anim_index.lab_idle, 6)
		ANBG.loop_anim(6, 0.43)
		DL.swap_name("Roman")
		DL.swap_dialogue("Anyway, when he died, was there really nothing in his system?")
		DL.prog_text()
		await DL.advance_text
		ANBG.end_anim()
		await ANBG.anim_looped
		ANBG.set_anim(ANBG.anim_index.lab_talk, 6)
		ANBG.loop_anim(6, 0.43)
		DL.swap_name("Doctor Edel")
		DL.swap_dialogue("No poison, he did however have a lot of sodium in his blood.")
		DL.prog_text()
		await DL.advance_text
		
		DL.swap_name("Doctor Edel")
		DL.swap_dialogue("His stomach acid contained a lot of yeast too, likely a few bagels or other baked goods.")
		DL.prog_text()
		await DL.advance_text
		DL.swap_dialogue("We figured he had a really salty lunch and the arteries disliked it.")
		DL.prog_text()
		await DL.advance_text
		ANBG.end_anim()
		await ANBG.anim_looped
		ANBG.set_anim(ANBG.anim_index.lab_idle, 6)
		ANBG.loop_anim(6, 0.43)
		DL.swap_name("Father Sidney")
		DL.swap_dialogue("We really can't be sure how this played out then, or by who.")
		DL.prog_text()
		await DL.advance_text
		ANBG.end_anim()
		await ANBG.anim_looped
		ANBG.set_anim(ANBG.anim_index.lab_talk, 6)
		ANBG.loop_anim(6, 0.43)
		DL.swap_name("Doctor Edel")
		DL.swap_dialogue("He kept a tape recorder, did he not? No list of enemies on a cassette?")
		DL.prog_text()
		await DL.advance_text
		
		ANBG.end_anim()
		await ANBG.anim_looped
		ANBG.swap_bg(ANBG.bg_index.drain)
		ANBG.set_anim(ANBG.anim_index.drain_drop, 6)
		DL.swap_name("16 Minutes Ago")
		DL.swap_dialogue("*On the walk to the Hospital*", true)
		await DL.prog_text()
		
		DL.swap_name("Roman")
		DL.swap_dialogue("Can you stop playing with the evidence? You WILL drop it.")
		DL.prog_text()
		await DL.advance_text
		DL.swap_name("Father Sidney")
		DL.swap_dialogue("What? You never used to fiddle with your cassettes?")
		DL.prog_text()
		await DL.advance_text
		DL.swap_dialogue("I'm basically a pro by now, do you know how boring it is to sit and listen in that box?")
		DL.prog_text()
		await DL.advance_text
		DL.swap_dialogue("See? I can balance it on my nos-", true)
		await DL.prog_text()
		await ANBG.play_anim_once(6, 0.12)
		
		ANBG.swap_bg(ANBG.bg_index.lab_path)
		ANBG.set_anim(ANBG.anim_index.lab_idle, 6)
		ANBG.loop_anim(6, 0.43)
		
		DL.swap_name("Father Sidney")
		DL.swap_dialogue("He did. As of right now it's still missing.")
		DL.prog_text()
		await DL.advance_text
		
		ANBG.end_anim()
		await ANBG.anim_looped
		ANBG.set_anim(ANBG.anim_index.lab_talk, 6)
		ANBG.loop_anim(6, 0.43)
		DL.swap_name("Doctor Edel")
		DL.swap_dialogue("Hm. Are there any other details necessary then?")
		DL.prog_text()
		await DL.advance_text
		ANBG.end_anim()
		await ANBG.anim_looped
		ANBG.set_anim(ANBG.anim_index.lab_idle, 6)
		ANBG.loop_anim(6, 0.43)
		DL.swap_name("Roman")
		DL.swap_dialogue("No, thank you. Actually how's the S.C.U.R.R.Y program going?")
		DL.prog_text()
		await DL.advance_text
		ANBG.end_anim()
		await ANBG.anim_looped
		ANBG.set_anim(ANBG.anim_index.lab_talk, 6)
		ANBG.loop_anim(6, 0.43)
		DL.swap_name("Doctor Edel")
		DL.swap_dialogue("Very good, however one of the rats escaped after we taught it to read.")
		DL.prog_text()
		await DL.advance_text
		ANBG.end_anim()
		await ANBG.anim_looped
		ANBG.set_anim(ANBG.anim_index.lab_idle, 6)
		ANBG.loop_anim(6, 0.43)
		DL.swap_name("Father Sidney")
		DL.swap_dialogue("*Chuckles*")
		DL.prog_text()
		await DL.advance_text
		ANBG.end_anim()
		await ANBG.anim_looped
		ANBG.set_anim(ANBG.anim_index.lab_talk, 6)
		ANBG.loop_anim(6, 0.43)
		DL.swap_name("Doctor Edel")
		DL.swap_dialogue("Why are you laughing. We've been set back months by it going missing.")
		DL.prog_text()
		await DL.advance_text
		ANBG.end_anim()
		await ANBG.anim_looped
		ANBG.set_anim(ANBG.anim_index.lab_idle, 6)
		ANBG.loop_anim(6, 0.43)
		DL.swap_name("Roman")
		DL.swap_dialogue("Sorry about him, he thought you weren't being serious. Come on Sidney.")
		DL.prog_text()
		await DL.advance_text
		DL.swap_name("Father Sidney")
		DL.swap_dialogue("Sorry ma'am, I just- I was caught off guard by a rat knowing english... like a cartoon.")
		DL.prog_text()
		await DL.advance_text
		DL.swap_dialogue("Again, apologies. Have a good day.")
		DL.prog_text()
		await DL.advance_text
	############ADD OPTION CHOICES
	
	#END
	DL.hide()
	ANBG.anim_state(false)


func rat_chase():
	DL.hide()
	ANBG.swap_bg(ANBG.bg_index.cafe_day)
	ANBG.set_anim(ANBG.anim_index.cafe_speak, 3)
	ANBG.loop_anim(3, 0.43)
	await get_tree().create_timer(0.2).timeout
	#DIALOGUE START
	DL.show()
	
	DL.swap_name("Father Sidney")
	DL.swap_dialogue("So basically some guy, likely a baker, gave Raisor a lethal amount of salt.")
	DL.prog_text()
	await DL.advance_text
	DL.swap_name("Roman")
	DL.swap_dialogue("It just... Sounds so stupid. Where's the motive?")
	DL.prog_text()
	await DL.advance_text
	DL.swap_dialogue("Do you think we're on the right track? At all?")
	DL.prog_text()
	await DL.advance_text
	
	DL.create_choices("Yes. We'll recieve a sign eventually.", "Probably not.")
	var investigan = await DL.get_choice()
	
	if investigan == 0:
		ALIGNMENT -= 1
		DL.swap_name("Roman")
		DL.swap_dialogue("Yeah. Sure. A 'Sign'. Priesthood changed you man.")
		DL.prog_text()
		await DL.advance_text
		DL.swap_dialogue("I appreciate your optimism though.")
		DL.prog_text()
		await DL.advance_text
	elif ALIGNMENT == 1:
		ALIGNMENT += 1
		DL.swap_name("Roman")
		DL.swap_dialogue("Pfft. And I thought the church gave you a sense of hope.")
		DL.prog_text()
		await DL.advance_text
		DL.swap_dialogue("You've always been honest, I like that about you.")
		DL.prog_text()
		await DL.advance_text
	DL.swap_name("Father Sidney")
	DL.swap_dialogue("Say what you want, we have to find out the truth. Even if we're wrong 50 times.")
	DL.prog_text()
	await DL.advance_text
	
	DL.swap_name("Roman")
	DL.swap_dialogue("Sidney. Why are you doing this? What does this 'case' really mean to you?")
	DL.prog_text()
	await DL.advance_text
	
	DL.create_choices("(Tell the truth)", "(Ignore)")
	var why = await DL.get_choice()
	
	if why == 0:
		DL.swap_name("Father Sidney")
		DL.swap_dialogue("When the evacuation happened, I thought everything was over.")
		DL.prog_text()
		await DL.advance_text
		DL.swap_dialogue("It was a wave of panic, like any of these buildings could come crashing down at any moment.")
		DL.prog_text()
		await DL.advance_text
		DL.swap_dialogue("Then Raisor found me and took me in.")
		DL.prog_text()
		await DL.advance_text
		DL.swap_dialogue("He demonstrated to me what it meant to have faith.")
		DL.prog_text()
		await DL.advance_text
		DL.swap_dialogue("A long time later and the buildings still haven't fell on their own.")
		DL.prog_text()
		await DL.advance_text
		DL.swap_name("Roman")
		DL.swap_dialogue("They still could you know.")
		DL.prog_text()
		await DL.advance_text
		DL.swap_dialogue("The government said the stone would fully break down by next spring and we've only just started winter.")
		DL.prog_text()
		await DL.advance_text
		DL.swap_name("Father Sidney")
		DL.swap_dialogue("I grew up here and I'm not leaving until my apartment crumbles to pieces.")
		DL.prog_text()
		await DL.advance_text
		DL.swap_name("Roman")
		DL.swap_dialogue("I understand that.")
		DL.prog_text()
		await DL.advance_text
		
	elif why == 1:
		DL.swap_dialogue("I'm sorry, I was out of line there.")
		DL.prog_text()
		await DL.advance_text
		DL.swap_dialogue("You have your reasons, I get it.")
		DL.prog_text()
		await DL.advance_text
		DL.swap_dialogue("I'd like you to know I don't believe you did it. I trust you.")
		DL.prog_text()
		await DL.advance_text
	
	DL.swap_name("Father Sidney")
	DL.swap_dialogue("Can you hear that?")
	DL.prog_text()
	await DL.advance_text
	DL.swap_name("Roman")
	DL.swap_dialogue("Is that noise annoying you too? Where is it even coming from?")
	DL.prog_text()
	await DL.advance_text
	DL.swap_dialogue("Well, it's not the people over there watching hockey. Sounds like it's outside.")
	DL.prog_text()
	await DL.advance_text
	DL.swap_name("???")
	DL.swap_dialogue("M..O..C..H..A")
	DL.prog_text()
	await DL.advance_text
	ANBG.end_anim()
	await ANBG.anim_looped
	ANBG.swap_bg(ANBG.bg_index.cafe_see_rat)
	ANBG.set_anim(ANBG.anim_index.cafe_ratrun, 5)
	ANBG.play_anim_once(5, 0.42)
	DL.swap_name("Father Sidney")
	DL.swap_dialogue("WAIT! Over there! That rat has the tape recorder!", true)
	await DL.prog_text()
	await get_tree().create_timer(1.4).timeout
	
	DL.swap_name("Roman")
	DL.swap_dialogue("Catch it! Now!", true)
	DL.prog_text()
	ANBG.swap_bg(ANBG.bg_index.deadend_alley)
	ANBG.set_anim(ANBG.anim_index.alley_ratchase, 3)
	await ANBG.play_anim_once(3, 0.72)
	await get_tree().create_timer(2).timeout
	
	DL.swap_name("Father Sidney")
	DL.swap_dialogue("Well, what now?")
	DL.prog_text()
	await DL.advance_text
	DL.swap_name("Roman")
	DL.swap_dialogue("It's staring. If it understands english it understands us.")
	DL.prog_text()
	await DL.advance_text
	DL.swap_name("Rat")
	DL.swap_dialogue("Squeak!")
	DL.prog_text()
	await DL.advance_text
	DL.swap_dialogue("Y..E..S")
	DL.prog_text()
	await DL.advance_text
	DL.swap_name("Father Sidney")
	DL.swap_dialogue("Uh... Alright! Were you trying to take us here?")
	DL.prog_text()
	await DL.advance_text
	DL.swap_name("Rat")
	DL.swap_dialogue("Y..E..S")
	DL.prog_text()
	await DL.advance_text
	DL.swap_dialogue("T..H..I..S     I...S    B..A..K..E")
	DL.prog_text()
	await DL.advance_text
	DL.swap_dialogue("N..E..W..S     S..A..Y")
	DL.prog_text()
	await DL.advance_text
	DL.swap_dialogue("Y..O..U     W..A..N..T    B..A..K..E")
	DL.prog_text()
	await DL.advance_text
	DL.swap_name("Father Sidney")
	DL.swap_dialogue("OKAY! Yes or no... Does 'Bake' have salted bagels?")
	DL.prog_text()
	await DL.advance_text
	DL.swap_name("Rat")
	DL.swap_dialogue("Y..E..S")
	DL.prog_text()
	await DL.advance_text
	DL.swap_name("Roman")
	DL.swap_dialogue("How do you know this?")
	DL.prog_text()
	await DL.advance_text
	DL.swap_name("Rat")
	DL.swap_dialogue("R..A..T   T..R..A..P")
	DL.prog_text()
	await DL.advance_text
	DL.swap_dialogue("M..E    W..A..N..T   B..G..L")
	DL.prog_text()
	await DL.advance_text
	DL.swap_dialogue("A..L..A..S        O..U..C..H")
	DL.prog_text()
	await DL.advance_text
	DL.swap_dialogue("H..I..M   B..O..X   M..E   ")
	DL.prog_text()
	await DL.advance_text
	DL.swap_dialogue("T..H..E..N    S..C..A..R..Y    S..E..W..E..R")
	DL.prog_text()
	await DL.advance_text
	DL.swap_name("Roman")
	DL.swap_dialogue("Ah... But you then jumped Outside The Box and followed a scent?")
	DL.prog_text()
	await DL.advance_text
	DL.swap_dialogue("Will you help us open this door by going through that mailbox?")
	DL.prog_text()
	await DL.advance_text
	DL.swap_name("Rat")
	DL.swap_dialogue("Y..E..S   H..E   S..P..A..R..E   K..E..Y   H..A..S")
	DL.prog_text()
	await DL.advance_text
	ANBG.swap_bg(ANBG.bg_index.bakery_door)
	ANBG.set_anim(ANBG.anim_index.door_flap, 3)
	await ANBG.play_anim_once(3, 0.72)
	DL.hide()
	ANBG.anim_state(false)

func rat_wait():
	ANBG.swap_bg(ANBG.bg_index.waiting_door)
	ANBG.set_anim(ANBG.anim_index.door_wait, 4)
	ANBG.loop_anim(4, 0.43)
	
	#DIALOGUE START
	DL.show()
	DL.swap_name("Roman")
	DL.swap_dialogue("While we're waiting, I actually have a few questions for you.")
	DL.prog_text()
	await DL.advance_text
	DL.swap_name("Father Sidney")
	DL.swap_dialogue("Go ahead.")
	DL.prog_text()
	await DL.advance_text
	DL.swap_name("Roman")
	DL.swap_dialogue("Your hair never used to be all... messy, like that.", true)
	await DL.prog_text()
	DL.swap_name("Father Sidney")
	DL.swap_dialogue("I know I know. I'm not exactly setting a holy standard.")
	DL.prog_text()
	await DL.advance_text
	DL.swap_name("Roman")
	DL.swap_dialogue("Why change it? Not even a quick comb?")
	DL.prog_text()
	await DL.advance_text
	
	DL.swap_name("Father Sidney")
	DL.swap_dialogue("This'll sound stupid. But when I was evacuating, I...")
	DL.prog_text()
	await DL.advance_text
	DL.swap_dialogue("I found people avoided me more, but the less fortunate were drawn to me.")
	DL.prog_text()
	await DL.advance_text
	DL.swap_dialogue("I helped a lot of people by looking this way.")
	DL.prog_text()
	await DL.advance_text
	DL.swap_dialogue("So now I don't bother much with my hair or skin.")
	DL.prog_text()
	await DL.advance_text
	
	DL.swap_name("Roman")
	DL.swap_dialogue("To show them nobody's perfect? That's oddly thoughtful of you.")
	DL.prog_text()
	await DL.advance_text
	
	DL.hide()
	await get_tree().create_timer(1.5).timeout
	DL.show()
	
	DL.swap_dialogue("You know, you never told me your favorite book.")
	DL.prog_text()
	await DL.advance_text
	
	DL.swap_name("Father Sidney")
	DL.swap_dialogue("Because I don't have one. Hemingway's stuff speaks to me though.")
	DL.prog_text()
	await DL.advance_text
	DL.swap_dialogue("Raisor recommended him! Told me about the old man and the sea.")
	DL.prog_text()
	await DL.advance_text
	DL.swap_name("Roman")
	DL.swap_dialogue("'A man can be destroyed but not defeated'. Classic.")
	DL.prog_text()
	await DL.advance_text
	DL.swap_name("Father Sidney")
	DL.swap_dialogue("I can't count the amount of times I've pulled out that quote.")
	DL.prog_text()
	await DL.advance_text
	DL.swap_dialogue("Especially during sermons with a LOT of time left or when I forget my cue cards.")
	DL.prog_text()
	await DL.advance_text
	
	DL.hide()
	await get_tree().create_timer(2.5).timeout
	DL.show()
	
	DL.swap_name("Roman")
	DL.swap_dialogue("What are you going to do when we find the guy?")
	DL.prog_text()
	await DL.advance_text
	
	DL.create_choices("Force them into church for the rest of their life.", "Bring him, and the evidence, to the police.")
	var end = await DL.get_choice()
	
	if end == 0: 
		ALIGNMENT -= 1
		DL.swap_name("Roman")
		DL.swap_dialogue("Make him repent?")
		DL.prog_text()
		await DL.advance_text
		DL.swap_dialogue("The old you would've just shot him...")
		DL.prog_text()
		await DL.advance_text
		DL.swap_dialogue("I'm glad you changed.")
		DL.prog_text()
		await DL.advance_text
	elif end == 1:
		ALIGNMENT += 1
		DL.swap_name("Roman")
		DL.swap_dialogue("Make him suffer in jail?")
		DL.prog_text()
		await DL.advance_text
		DL.swap_dialogue("The old you would've just shot him...")
		DL.prog_text()
		await DL.advance_text
		DL.swap_dialogue("I'm really glad we're finally on the same page about the law.")
		DL.prog_text()
		await DL.advance_text
	DL.hide()
	ANBG.set_anim(ANBG.anim_index.door_unlock, 4)
	await ANBG.play_anim_once(3, 0.72)
	DL.show()
	DL.swap_name("Father Sidney")
	DL.swap_dialogue("That's our cue.")
	DL.prog_text()
	await DL.advance_text
	
func bakery():
	
	ANBG.swap_bg(ANBG.bg_index.open_door)
	ANBG.set_anim(ANBG.anim_index.door_open, 3)
	await ANBG.play_anim_once(3, 0.43)
	
	ANBG.swap_bg(ANBG.bg_index.desk_shop)
	ANBG.set_anim(ANBG.anim_index.bakery_walkin, 4)
	ANBG.loop_anim(4, 0.43)
	
	ANBG.end_anim()
	await ANBG.anim_looped
	
	ANBG.set_anim(ANBG.anim_index.bakery_papers, 4)
	ANBG.loop_anim(4, 0.43)
	
	ANBG.end_anim()
	await ANBG.anim_looped
	
	ANBG.set_anim(ANBG.anim_index.bakery_noisehear, 4)
	await ANBG.play_anim_once(4, 0.43)
	
	
	DL.show()
	DL.swap_name("_")
	DL.swap_dialogue("_")
	DL.prog_text()
	await DL.advance_text
	
	ANBG.set_anim(ANBG.anim_index.priest_conf1, 3)
	ANBG.loop_anim(3, 0.4)
	DL.show()
	DL.swap_name("Bowie")
	DL.swap_dialogue("But whooooooooooooo\nWill love alladin saane?")
	DL.prog_text()
	await DL.advance_text
	DL.swap_dialogue("Tis a pity she was a whore") #please ignore the david bowie placeholders
	DL.prog_text()
	await DL.advance_text
	DL.swap_dialogue("Ground control to MAAAAAJor tom")
	DL.prog_text()
	await DL.advance_text
	DL.hide()
	ANBG.anim_state(false)

func law_ending():
	
	#SETUP
	ANBG.swap_bg(ANBG.bg_index.confess1)
	ANBG.set_anim(ANBG.anim_index.confess1, 3)
	ANBG.loop_anim(3, 0.43)
	
	#DIALOGUE START
	DL.show()
	DL.swap_name("_")
	DL.swap_dialogue("_")
	DL.prog_text()
	await DL.advance_text
	
	#Reg dialogue
	DL.swap_name("_")
	DL.swap_dialogue("_")
	DL.prog_text()
	await DL.advance_text
	
	#Cut-off dialogue
	DL.swap_name("_")
	DL.swap_dialogue("_", true)
	await DL.prog_text()
	
	#newloop	
	ANBG.end_anim()
	await ANBG.anim_looped
	ANBG.swap_bg(ANBG.bg_index.confess2)
	ANBG.set_anim(ANBG.anim_index.confess2, 3)
	ANBG.loop_anim(2, 0.43)
	
	#END
	DL.hide()
	ANBG.anim_state(false)


func faith_ending():
	
	#SETUP
	ANBG.swap_bg(ANBG.bg_index.confess1)
	ANBG.set_anim(ANBG.anim_index.confess1, 3)
	ANBG.loop_anim(3, 0.43)
	
	#DIALOGUE START
	DL.show()
	DL.swap_name("_")
	DL.swap_dialogue("_")
	DL.prog_text()
	await DL.advance_text
	
	#Reg dialogue
	DL.swap_name("_")
	DL.swap_dialogue("_")
	DL.prog_text()
	await DL.advance_text
	
	#Cut-off dialogue
	DL.swap_name("_")
	DL.swap_dialogue("_", true)
	await DL.prog_text()
	
	#newloop	
	ANBG.end_anim()
	await ANBG.anim_looped
	ANBG.swap_bg(ANBG.bg_index.confess2)
	ANBG.set_anim(ANBG.anim_index.confess2, 3)
	ANBG.loop_anim(2, 0.43)
	
	#END
	DL.hide()
	ANBG.anim_state(false)


func placeholder():
	#SETUP
	ANBG.swap_bg(ANBG.bg_index.confess1)
	ANBG.set_anim(ANBG.anim_index.confess1, 3)
	ANBG.loop_anim(3, 0.43)
	
	#DIALOGUE START
	DL.show()
	DL.swap_name("_")
	DL.swap_dialogue("_")
	DL.prog_text()
	await DL.advance_text
	
	#Reg dialogue
	DL.swap_name("_")
	DL.swap_dialogue("_")
	DL.prog_text()
	await DL.advance_text
	
	#Cut-off dialogue
	DL.swap_name("_")
	DL.swap_dialogue("_", true)
	await DL.prog_text()
	
	#newloop	
	ANBG.end_anim()
	await ANBG.anim_looped
	ANBG.swap_bg(ANBG.bg_index.confess2)
	ANBG.set_anim(ANBG.anim_index.confess2, 3)
	ANBG.loop_anim(2, 0.43)
	
	#choices (alignment)
	DL.create_choices("Whaaaaaaaaaat", "Im the bad one lol")
	var temp = await DL.get_choice()
	if temp == 0:
		print("cowabunga dude")
	
	#END
	DL.hide()
	ANBG.anim_state(false)
