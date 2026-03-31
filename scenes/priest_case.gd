extends Node2D

#["After the rat went Outside The Box, It pursued the surface.",
		#"And the rat climbed, for it had nowhere else to go.", 
		#"Up the pipe, wondering, why it was there in the first place.", 
		#"But the rat felt the importance of the device.", 
		#"It persisted upwards, until a crack of opportunity allowed its freedom." 
		#],
		#
	#"1"=["It was drawn in by the half-familiar smell. Yet again the rat found itself driven by the strive to continue.", 
		#"So it knew to try and garner attention.", 
		#"That was its method to find the owner of the device.",
		#],
	#
	#"2"=["The rat was piecing its memory back together little by little. It had remembered why it was put in that box.",
		#"During which, it found success, it found two people who were deeply interested. They wanted to help the rat.", 
		#"It thought it may finally return the device, and find home."
		#],
	#
	#"3"=[
		#"Thus, I conclude the story of the rat.", 
		#"In summary.", 
		#"The rat found itself lost, in a box, grasping for any familiarity, any place to call home.", 
		#"Yet it had a heart, a heart of which was more caring than most.", 
		#"It had donned the duty of finding the owner of the device.",
		#"Despite that the rat had been hurt by who it thought owned the device, it still wanted to make amends.", 
		#"The rat never knew the true owner was long gone. The rat never truly had a home either.",
		#"Yet, I strive to be the rat. We all, should strive to have its level of courage.", 
		#"And so today marks my final day here in this church.",
		#"Sandstone is like our box, we feel trapped but we can leave at any time.",
		#"I encourage you all to do the same as the rat, find your way Outside The Box. Follow yourself.",
		#"Thank you all."
		#]

var ALIGNMENT = 0
@export var DL: dialogue
@export var ANBG: animatedBg
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	DL.priestify()
	
	MSC.volume_db = -2
	MSC.set_file(MSC.paths.confession)
	MSC.play()
	await confessional()
	MSC.set_file(MSC.paths.caferun)
	await where_first()
	MSC.set_file(MSC.paths.interviews)
	await interviews()
	await rat_chase()
	await rat_wait()
	await bakery()
	if ALIGNMENT > 0:
		await law_ending()
	else:
		await faith_ending()
	get_tree().call_deferred("change_scene_to_file", "res://scenes/main.tscn")
	
	
	#TAke to main screen, or blank with "u got a medal"
	#Finish:
	#Bakery
	#Law and faith endings
	#Count num of opts

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
	DL.swap_dialogue("You understand the rough patch Sandstone has had these past few years, Sidney. More than anyone.")
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
	DL.swap_dialogue("But he died of a heart attack. There's nothing to investigate.")
	DL.prog_text()
	await DL.advance_text
	DL.swap_dialogue("Some hoodlum just dropped it off to freak you out.")
	DL.prog_text()
	await DL.advance_text
	DL.swap_name("Father Sidney")
	DL.swap_dialogue("That's the thing though,")
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
	DL.swap_dialogue("But, again. Heart attack. No poison was found in his blood.")
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
		DL.swap_dialogue("Hm, that can be exploited Sidney.")
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
		DL.swap_dialogue("Yeah, Like in 2002, with that doctor who gave her patients clotting agents on purpose.")
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
		DL.swap_dialogue("We understand it was over a year ago, but where were you around the time he died?")
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
		DL.swap_dialogue("Listened to his cassettes for longer than I'd like to admit.")
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
		DL.swap_dialogue("Well actually I'm still kind of a priest...-", true)
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
		
		DL.swap_name("Father Sidney")
		DL.swap_dialogue("That can be exploited. Like that case with that doctor.")
		DL.prog_text()
		await DL.advance_text
		DL.swap_dialogue("The one who gave her patients clotting agents on purpose. In 2002 I believe.")
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
		DL.swap_dialogue("We really can't be sure why this played out then, or by who.")
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
		ANBG.set_anim(ANBG.anim_index.drain_drop, 5)
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
		await ANBG.play_anim_once(5, 0.12)
		
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
	ANBG.end_anim()
	await ANBG.anim_looped
	
	DL.hide()
	ANBG.swap_bg(ANBG.bg_index.cafe_day)
	ANBG.set_anim(ANBG.anim_index.cafe_speak, 3)
	ANBG.loop_anim(3, 0.43)
	await get_tree().create_timer(0.2).timeout
	#DIALOGUE START
	DL.show()
	
	DL.swap_name("Father Sidney")
	DL.swap_dialogue("Alright, overall where are we at.")
	DL.prog_text()
	await DL.advance_text
	DL.swap_name("Roman")
	DL.swap_dialogue("Sent out the request to the journalists at Sand-Paper just in time for printing.")
	DL.prog_text()
	await DL.advance_text
	DL.swap_dialogue("And that mannequin? Clean as a whistle, no prints.")
	DL.prog_text()
	await DL.advance_text
	DL.swap_dialogue("Definitely someone with access to plastic gloves.")
	DL.prog_text()
	await DL.advance_text
	
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
		ALIGNMENT -= 1
		DL.swap_name("Father Sidney")
		DL.swap_dialogue("When the evacuation started, I thought everything was over.")
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
		DL.swap_dialogue("A long time later and these buildings still haven't fell on their own.")
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
		ALIGNMENT += 1
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
	DL.swap_dialogue("Hold on- What's that commotion?")
	DL.prog_text()
	await DL.advance_text
	DL.swap_name("Roman")
	DL.swap_dialogue("Probably annoyed people, mad that there's still no waiter.")
	DL.prog_text()
	await DL.advance_text
	DL.swap_name("???")
	DL.swap_dialogue("M..O..C..H..A")
	DL.prog_text()
	await DL.advance_text
	DL.swap_name("Angry Man")
	DL.swap_dialogue("Can ANY member of staff get that darned rat?")
	DL.prog_text()
	await DL.advance_text
	DL.swap_name("Angrier Man")
	DL.swap_dialogue("Don't it know 'bout the fact Mocha's NEVER sold in here!")
	DL.prog_text()
	await DL.advance_text
	DL.swap_name("Roman")
	DL.swap_dialogue("..Is that rat carrying something?")
	DL.prog_text()
	await DL.advance_text
	ANBG.end_anim()
	await ANBG.anim_looped
	ANBG.swap_bg(ANBG.bg_index.cafe_see_rat)
	ANBG.set_anim(ANBG.anim_index.cafe_ratrun, 5)
	ANBG.play_anim_once(5, 0.42)
	DL.swap_name("Father Sidney")
	DL.swap_dialogue("Over there! Come on! That rat has the tape recorder!", true)
	await DL.prog_text()
	await get_tree().create_timer(1.4).timeout
	
	DL.swap_name("Roman")
	DL.swap_dialogue("Let's get it! Quickly!", true)
	DL.prog_text()
	ANBG.swap_bg(ANBG.bg_index.deadend_alley)
	ANBG.set_anim(ANBG.anim_index.alley_ratchase, 3)
	await ANBG.play_anim_once(3, 0.72)
	await get_tree().create_timer(2).timeout
	
	DL.swap_name("Father Sidney")
	DL.swap_dialogue("*huff* Well, what now?")
	DL.prog_text()
	await DL.advance_text
	DL.swap_name("Roman")
	DL.swap_dialogue("It's staring. It might be understanding us.")
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
	DL.swap_dialogue("N..O")
	DL.prog_text()
	await DL.advance_text
	DL.swap_dialogue("T..H..I..S     I...S    B..A..K..E")
	DL.prog_text()
	await DL.advance_text
	DL.swap_dialogue("B..A..K..E    M..A..N    B..A..D ")
	DL.prog_text()
	await DL.advance_text
	DL.swap_dialogue("Y..O..U    H..E..L..P? ")
	DL.prog_text()
	await DL.advance_text
	DL.swap_name("Father Sidney")
	DL.swap_dialogue("We... Yes we can! Give us detail, why is uh. 'Bake Man' Bad?")
	DL.prog_text()
	await DL.advance_text
	DL.swap_name("Rat")
	DL.swap_dialogue("I    R..E   M..E..M..B..E..R    V..O..I..C..E")
	DL.prog_text()
	await DL.advance_text
	DL.swap_dialogue("S..A..M..E    V..O..I..C..E   O..N")
	DL.prog_text()
	await DL.advance_text
	DL.swap_dialogue("O..N    T..A..P..E     S..I..D..E    B..")
	DL.prog_text()
	await DL.advance_text
	DL.swap_name("Roman")
	DL.swap_dialogue("How do you know this 'Bake Man'?")
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
	DL.swap_name("Father Sidney")
	DL.swap_dialogue("OKAY! Yes or no, Were these... 'BGL's, bagels?")
	DL.prog_text()
	await DL.advance_text
	DL.swap_name("Rat")
	DL.swap_dialogue("Y..E..S       S..A..L..T   ..E..D")
	DL.prog_text()
	await DL.advance_text

	DL.swap_name("Father Sidney")
	DL.swap_dialogue("How did you end up with that tape recorder?")
	DL.prog_text()
	await DL.advance_text
	
	DL.swap_name("Rat")
	DL.swap_dialogue("M..E     F..I..N..D     T..R..")
	DL.prog_text()
	await DL.advance_text
	
	DL.swap_dialogue("A..F..T..E..R    H..I..M   B..O..X   M..E   ")
	DL.prog_text()
	await DL.advance_text
	DL.swap_dialogue("S..C..A..R..Y    S..E..W..E..R")
	DL.prog_text()
	await DL.advance_text
	
	
	DL.swap_name("Roman")
	DL.swap_dialogue("Ah... But you jumped Outside The Box, started looking for him after finding 'his' recorder?")
	DL.prog_text()
	await DL.advance_text
	DL.swap_dialogue("Will you help us open this door by going through that mailbox?")
	DL.prog_text()
	await DL.advance_text
	DL.swap_name("Rat")
	DL.swap_dialogue("Y..E..S   H..E   S..P..A..R..E   K..E..Y   H..A..S")
	DL.prog_text()
	await DL.advance_text
	DL.swap_dialogue("Y..O..U     H..E..L..P    M..E    F..I..N..D    B..A..K..E!")
	DL.prog_text()
	await DL.advance_text
	DL.swap_dialogue("M..A..N..Y    T..H..A..N..K")
	DL.prog_text()
	await DL.advance_text
	DL.hide()
	ANBG.swap_bg(ANBG.bg_index.bakery_door)
	ANBG.set_anim(ANBG.anim_index.door_flap, 4)
	await ANBG.play_anim_once(4, 0.72)
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
	DL.swap_dialogue("For me? Go ahead.")
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
	DL.swap_dialogue("This'll sound stupid. But when I was helping others evacuate...")
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
	DL.swap_dialogue("Because I don't really have one.")
	DL.prog_text()
	await DL.advance_text
	DL.swap_dialogue("Raisor recommended Hemingway once. Told me about the old man and the sea.")
	DL.prog_text()
	await DL.advance_text
	DL.swap_dialogue("'A man can be destroyed but not defeated'.")
	DL.prog_text()
	await DL.advance_text
	DL.swap_dialogue("I can't count the amount of times I've pulled out that quote.")
	DL.prog_text()
	await DL.advance_text
	DL.swap_dialogue("Especially during sermons with a LOT of time left or when I forget my cue cards.")
	DL.prog_text()
	await DL.advance_text
	DL.swap_name("Roman")
	DL.swap_dialogue("I guess that's fair. Next question.")
	DL.prog_text()
	await DL.advance_text
	DL.swap_dialogue("Why do you believe some people still live here?")
	DL.prog_text()
	await DL.advance_text
	DL.swap_name("Father Sidney")
	DL.swap_dialogue("Family.")
	DL.prog_text()
	await DL.advance_text
	DL.swap_dialogue("They can't afford to leave. People aren't just going to abandon what they have here.")
	DL.prog_text()
	await DL.advance_text
	DL.swap_dialogue("I'd leave if I didn't have the same sort of attachment to this place.")
	DL.prog_text()
	await DL.advance_text
	DL.swap_dialogue("I wouldn't abandon the church unless I found a replacement for myself.")
	DL.prog_text()
	await DL.advance_text
	DL.swap_name("Roman")
	DL.swap_dialogue("Too many people you know that rely on your help?")
	DL.prog_text()
	await DL.advance_text
	DL.swap_dialogue("Especially with Raisor gone...")
	DL.prog_text()
	await DL.advance_text
	DL.swap_name("Father Sidney")
	DL.swap_dialogue("Yeah.")
	DL.prog_text()
	await DL.advance_text
	
	DL.hide()
	await get_tree().create_timer(2.5).timeout
	DL.show()
	
	DL.swap_name("Roman")
	DL.swap_dialogue("What are you going to do when we catch the guy?")
	DL.prog_text()
	await DL.advance_text
	
	DL.create_choices("Force him into church for the rest of his life.", "Bring him, and the evidence, to the police.")
	var end = await DL.get_choice()
	
	if end == 0:
		ALIGNMENT -= 1
		DL.swap_name("Roman")
		DL.swap_dialogue("Make him repent?")
		DL.prog_text()
		await DL.advance_text
		DL.swap_dialogue("The old you would've just made him rot in jail...")
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
		DL.swap_dialogue("I thought the new you would've forced him to repent...")
		DL.prog_text()
		await DL.advance_text
		DL.swap_dialogue("I'm really glad we're on the same page about this.")
		DL.prog_text()
		await DL.advance_text
	DL.hide()
	ANBG.end_anim()
	await ANBG.anim_looped
	ANBG.set_anim(ANBG.anim_index.door_unlock, 4)
	await ANBG.play_anim_once(4, 0.72)
	
	ANBG.set_anim(ANBG.anim_index.door_wait, 4)
	ANBG.loop_anim(4, 0.43)
	DL.show()
	DL.swap_name("Father Sidney")
	DL.swap_dialogue("That's our cue.")
	DL.prog_text()
	await DL.advance_text
	ANBG.end_anim()
	await ANBG.anim_looped
	DL.hide()
	
func bakery():
	
	ANBG.swap_bg(ANBG.bg_index.open_door)
	ANBG.set_anim(ANBG.anim_index.door_open, 3)
	await ANBG.play_anim_once(3, 0.43)
	
	ANBG.swap_bg(ANBG.bg_index.desk_shop)
	ANBG.set_anim(ANBG.anim_index.bakery_walkin, 4)
	ANBG.loop_anim(4, 0.43)
	
	DL.show()
	DL.swap_name("Father Sidney")
	DL.swap_dialogue("Stay there, I don't want to make noise if he's here.")
	DL.prog_text()
	await DL.advance_text
	DL.swap_name("Roman")
	DL.swap_dialogue("Of course.")
	DL.prog_text()
	await DL.advance_text
	
	ANBG.end_anim()
	await ANBG.anim_looped
	
	ANBG.set_anim(ANBG.anim_index.bakery_papers, 4)
	ANBG.loop_anim(4, 0.43)
	DL.swap_name("Father Sidney")
	DL.swap_dialogue("(Lets see...)")
	DL.prog_text()
	await DL.advance_text
	DL.swap_dialogue("(He hasn't paid rent in a while.)")
	DL.prog_text()
	await DL.advance_text
	DL.swap_dialogue("(Seems like.... Damien, Damien Black, is having a rough few months.)")
	DL.prog_text()
	await DL.advance_text
	DL.swap_dialogue("(Financial motive? But he didn't steal anything expensive...)")
	DL.prog_text()
	await DL.advance_text
	DL.swap_dialogue("(Oh, there's a menu here too.)")
	DL.prog_text()
	await DL.advance_text
	DL.swap_dialogue("(Bear claws... Brownies... Cupcakes......... and Salted Bagels.)")
	DL.prog_text()
	await DL.advance_text
	ANBG.end_anim()
	await ANBG.anim_looped
	
	ANBG.set_anim(ANBG.anim_index.bakery_noisehear, 4)
	ANBG.loop_anim(4, 0.43)
	DL.swap_dialogue("Roman. Over here, I heard something...")
	DL.prog_text()
	await DL.advance_text # rustle sfx
	
	ANBG.end_anim()
	await ANBG.anim_looped
	
	DL.hide()
	########################
	ANBG.swap_bg(ANBG.bg_index.bakerside_kitchen)
	ANBG.set_anim(ANBG.anim_index.baker_getup,4)
	await ANBG.play_anim_once(4, 0.43)
	#confrontation, whyd ya do it blah blah blah
	ANBG.set_anim(ANBG.anim_index.baker_caution, 4)
	await ANBG.play_anim_once(4, 0.43)
	
	
	DL.show()
	ANBG.swap_bg(ANBG.bg_index.bakerside_kitchen)
	ANBG.set_anim(ANBG.anim_index.baker_talk, 4)
	ANBG.loop_anim(4, 0.43)
	DL.swap_name("Damien")
	DL.swap_dialogue("Bakery's closed. How did you get in?-", true)
	await DL.prog_text()
	
	ANBG.end_anim()
	await ANBG.anim_looped
	ANBG.swap_bg(ANBG.bg_index.priest_kitchen)
	ANBG.set_anim(ANBG.anim_index.kitchen_talk, 4)
	ANBG.loop_anim(4, 0.43)
	DL.swap_name("Father Sidney")
	DL.swap_dialogue("How are you today. My child?")
	DL.prog_text()
	await DL.advance_text
	DL.hide()
	ANBG.end_anim()
	await ANBG.anim_looped
	
	ANBG.swap_bg(ANBG.bg_index.bakerside_kitchen)
	ANBG.set_anim(ANBG.anim_index.baker_caution, 4)
	ANBG.loop_anim(4, 0.43)
	await get_tree().create_timer(3).timeout
	
	ANBG.end_anim()
	await ANBG.anim_looped
	ANBG.set_anim(ANBG.anim_index.baker_talk, 4)
	ANBG.loop_anim(4, 0.43)
	DL.swap_name("Damien")
	DL.show()
	DL.swap_dialogue("I'm good. You work at the church, don't you? Father uh... Remind me.")
	DL.prog_text()
	await DL.advance_text
	
	ANBG.end_anim()
	await ANBG.anim_looped
	ANBG.swap_bg(ANBG.bg_index.priest_kitchen)
	ANBG.set_anim(ANBG.anim_index.kitchen_talk, 4)
	ANBG.loop_anim(4, 0.43)
	DL.swap_name("Father Sidney")
	DL.swap_dialogue("Sidney, but you already knew that, didn't you?")
	DL.prog_text()
	await DL.advance_text
	
	DL.swap_name("Roman")
	DL.swap_dialogue("Would you mind answering a few questions?")
	DL.prog_text()
	await DL.advance_text
	
	ANBG.end_anim()
	await ANBG.anim_looped
	ANBG.swap_bg(ANBG.bg_index.bakerside_kitchen)
	ANBG.set_anim(ANBG.anim_index.baker_talk, 4)
	ANBG.loop_anim(4, 0.43)
	DL.swap_name("Damien")
	DL.swap_dialogue("Of course, but uh. I have a... I need to go home.")
	DL.prog_text()
	await DL.advance_text
	DL.swap_dialogue("I can come to the church tomorrow if-", true)
	DL.prog_text()
	await DL.advance_text
	
	ANBG.end_anim()
	await ANBG.anim_looped
	ANBG.swap_bg(ANBG.bg_index.priest_kitchen)
	ANBG.set_anim(ANBG.anim_index.kitchen_talk, 4)
	ANBG.loop_anim(4, 0.43)
	DL.swap_name("Roman")
	DL.swap_dialogue("Don't worry, it won't take long.")
	DL.prog_text()
	await DL.advance_text
	DL.swap_name("Father Sidney")
	DL.swap_dialogue("Do you pray often, Mister Damien?")
	DL.prog_text()
	await DL.advance_text
	
	ANBG.end_anim()
	await ANBG.anim_looped
	ANBG.swap_bg(ANBG.bg_index.bakerside_kitchen)
	ANBG.set_anim(ANBG.anim_index.baker_talk, 4)
	ANBG.loop_anim(4, 0.43)
	DL.swap_name("Damien")
	DL.swap_dialogue("Admittedly no. I haven't ever since... No. I haven't.")
	DL.prog_text()
	await DL.advance_text

	ANBG.end_anim()
	await ANBG.anim_looped
	ANBG.swap_bg(ANBG.bg_index.priest_kitchen)
	ANBG.set_anim(ANBG.anim_index.kitchen_talk, 4)
	ANBG.loop_anim(4, 0.43)
	DL.swap_name("Father Sidney")
	DL.swap_dialogue("This is a safe space, Why don't you pray Damien?")
	DL.prog_text()
	await DL.advance_text
	DL.swap_name("Roman")
	DL.swap_dialogue("That's an unfair question, would you like some tea, sir?")
	DL.prog_text()
	await DL.advance_text
	
	ANBG.end_anim()
	await ANBG.anim_looped
	ANBG.swap_bg(ANBG.bg_index.bakerside_kitchen)
	ANBG.set_anim(ANBG.anim_index.baker_talk, 4)
	ANBG.loop_anim(4, 0.43)
	DL.swap_name("Damien")
	DL.swap_dialogue("Well... Coffee would be fine... two sugars-", true)
	await DL.prog_text()
	
	ANBG.end_anim()
	await ANBG.anim_looped
	ANBG.swap_bg(ANBG.bg_index.priest_kitchen)
	ANBG.set_anim(ANBG.anim_index.kitchen_talk, 4)
	ANBG.loop_anim(4, 0.43)
	DL.swap_name("Father Sidney")
	DL.swap_dialogue("When you poisoned Minister Raisor, what were you thinking?")
	DL.prog_text()
	await DL.advance_text
	
	ANBG.end_anim()
	await ANBG.anim_looped
	ANBG.swap_bg(ANBG.bg_index.bakerside_kitchen)
	ANBG.set_anim(ANBG.anim_index.baker_talk, 4)
	ANBG.loop_anim(4, 0.43)
	DL.swap_name("Damien")
	DL.swap_dialogue("I didn't poison him-! I-! That's not-!", true)
	await DL.prog_text()
	
	ANBG.end_anim()
	await ANBG.anim_looped
	ANBG.swap_bg(ANBG.bg_index.priest_kitchen)
	ANBG.set_anim(ANBG.anim_index.kitchen_talk, 4)
	ANBG.loop_anim(4, 0.43)
	DL.swap_name("Father Sidney")
	DL.swap_dialogue("That's right, you didn't poison him.")
	DL.prog_text()
	await DL.advance_text
	DL.swap_dialogue("You just gave him four times the safe amount of sodium.")
	DL.prog_text()
	await DL.advance_text
	
	ANBG.end_anim()
	await ANBG.anim_looped
	ANBG.swap_bg(ANBG.bg_index.bakerside_kitchen)
	ANBG.set_anim(ANBG.anim_index.baker_talk, 4)
	ANBG.loop_anim(4, 0.43)
	DL.swap_name("Damien")
	DL.swap_dialogue("No- I- I...", true)
	await DL.prog_text()
	
	ANBG.end_anim()
	await ANBG.anim_looped
	ANBG.swap_bg(ANBG.bg_index.priest_kitchen)
	ANBG.set_anim(ANBG.anim_index.kitchen_talk, 4)
	ANBG.loop_anim(4, 0.43)
	DL.swap_name("Roman")
	DL.swap_dialogue("You killed Minister Raisor, but why? Why!")
	DL.prog_text()
	await DL.advance_text
	
	ANBG.end_anim()
	await ANBG.anim_looped
	ANBG.swap_bg(ANBG.bg_index.bakerside_kitchen)
	ANBG.set_anim(ANBG.anim_index.baker_talk, 4)
	ANBG.loop_anim(4, 0.43)
	DL.swap_name("Damien")
	DL.swap_dialogue("Okay! Okay!", true)
	await DL.prog_text()
	DL.swap_dialogue("I did it. Fine, I did it. I admit it.")
	DL.prog_text()
	await DL.advance_text
	
	ANBG.end_anim()
	await ANBG.anim_looped
	ANBG.swap_bg(ANBG.bg_index.priest_kitchen)
	ANBG.set_anim(ANBG.anim_index.kitchen_talk, 4)
	ANBG.loop_anim(4, 0.43)
	DL.swap_name("Father Sidney")
	DL.swap_dialogue("Why did you do any of this? You clearly have remorse.")
	DL.prog_text()
	await DL.advance_text
	DL.swap_dialogue("For someone who confessed on tape, you're too defensive.")
	DL.prog_text()
	await DL.advance_text
	
	ANBG.end_anim()
	await ANBG.anim_looped
	ANBG.swap_bg(ANBG.bg_index.bakerside_kitchen)
	ANBG.set_anim(ANBG.anim_index.baker_talk, 4)
	ANBG.loop_anim(4, 0.43)
	DL.swap_name("Damien")
	DL.swap_dialogue("I just wanted to confess...")
	DL.prog_text()
	await DL.advance_text
	DL.swap_dialogue("I didn't think you would hunt me down!")
	DL.prog_text()
	await DL.advance_text
	
	ANBG.end_anim()
	await ANBG.anim_looped
	ANBG.swap_bg(ANBG.bg_index.priest_kitchen)
	ANBG.set_anim(ANBG.anim_index.kitchen_talk, 4)
	ANBG.loop_anim(4, 0.43)
	DL.create_choices("We only came to ask for the truth.", "Damn right we've been hunting you. Give us answers.")
	var lie = await DL.get_choice()
	if lie == 0: 
		ALIGNMENT -= 1
		DL.swap_name("Roman")
		DL.swap_dialogue("(Maybe Sidney isn't focused on an arrest...)")
		DL.prog_text()
		await DL.advance_text
	elif lie == 1:
		ALIGNMENT += 1
		DL.swap_name("Roman")
		DL.swap_dialogue("(Woah! Sidney hates this guy!)")
		DL.prog_text()
		await DL.advance_text
	
	DL.swap_name("Roman")
	DL.swap_dialogue("Yeah. And you still haven't answered why you killed Raisor.")
	DL.prog_text()
	await DL.advance_text
	
	ANBG.end_anim()
	await ANBG.anim_looped
	ANBG.swap_bg(ANBG.bg_index.bakerside_kitchen)
	ANBG.set_anim(ANBG.anim_index.baker_talk, 4)
	ANBG.loop_anim(4, 0.43)
	DL.swap_name("Damien")
	DL.swap_dialogue("I- Ever since the evacuation, the economy in this city...")
	DL.prog_text()
	await DL.advance_text
	DL.swap_dialogue("It's been rough. And my most popular item is going to be banned!")
	DL.prog_text()
	await DL.advance_text
	DL.swap_dialogue("The CFIA screwed me over with the new food legislations. I don't care that Salted Bagels are dangerous.")
	DL.prog_text()
	await DL.advance_text
	DL.swap_dialogue("If I can't sell them, I can't pay rent. And if I can't pay rent...")
	DL.prog_text()
	await DL.advance_text
	
	ANBG.end_anim()
	await ANBG.anim_looped
	ANBG.swap_bg(ANBG.bg_index.priest_kitchen)
	ANBG.set_anim(ANBG.anim_index.kitchen_talk, 4)
	ANBG.loop_anim(4, 0.43)
	DL.swap_name("Roman")
	DL.swap_dialogue("Then why didn't you just steal Raisor's jewellery?")
	DL.prog_text()
	await DL.advance_text
	
	ANBG.end_anim()
	await ANBG.anim_looped
	ANBG.swap_bg(ANBG.bg_index.bakerside_kitchen)
	ANBG.set_anim(ANBG.anim_index.baker_talk, 4)
	ANBG.loop_anim(4, 0.43)
	DL.swap_name("Damien")
	DL.swap_dialogue("The jewellery would've been too obvious. And I panicked.")
	DL.prog_text()
	await DL.advance_text
	DL.swap_dialogue("I thought the tape would come in handy somehow, it never did.")
	DL.prog_text()
	await DL.advance_text
	
	ANBG.end_anim()
	await ANBG.anim_looped
	ANBG.swap_bg(ANBG.bg_index.priest_kitchen)
	ANBG.set_anim(ANBG.anim_index.kitchen_talk, 4)
	ANBG.loop_anim(4, 0.43)
	DL.swap_name("Roman")
	DL.swap_dialogue("Why do you need money so badly. And why only in such a careful way?")
	DL.prog_text()
	await DL.advance_text
	
	ANBG.end_anim()
	await ANBG.anim_looped
	ANBG.swap_bg(ANBG.bg_index.bakerside_kitchen)
	ANBG.set_anim(ANBG.anim_index.baker_talk, 4)
	ANBG.loop_anim(4, 0.43)
	DL.swap_name("Damien")
	DL.swap_dialogue("Because of my mother... She lost her legs. Trampled. Broke both her knees beyond saving.")
	DL.prog_text()
	await DL.advance_text
	DL.swap_dialogue("When I have no home, She has no home. I can't risk anything too severely.")
	DL.prog_text()
	await DL.advance_text
	DL.swap_dialogue("She's only alive because you helped her Sidney. During the evacuation.")
	DL.prog_text()
	await DL.advance_text
	
	ANBG.end_anim()
	await ANBG.anim_looped
	ANBG.swap_bg(ANBG.bg_index.priest_kitchen)
	ANBG.set_anim(ANBG.anim_index.kitchen_talk, 4)
	ANBG.loop_anim(4, 0.43)
	DL.swap_name("Father Sidney")
	DL.swap_dialogue("The old lady, with the swelling... she...", true)
	await DL.prog_text()
	DL.swap_dialogue("No! Shut up! Damien, stop- Why Raisor. Why. Raisor!")
	DL.prog_text()
	await DL.advance_text
	
	ANBG.end_anim()
	await ANBG.anim_looped
	ANBG.swap_bg(ANBG.bg_index.bakerside_kitchen)
	ANBG.set_anim(ANBG.anim_index.baker_talk, 4)
	ANBG.loop_anim(4, 0.43)
	DL.swap_name("Damien")
	DL.swap_dialogue("Minister Raisor is the most popular figure in Sandstone.")
	DL.prog_text()
	await DL.advance_text
	DL.swap_dialogue("My favorite customer. Even though he only came once a week.")
	DL.prog_text()
	await DL.advance_text
	DL.swap_dialogue("If he died infront of my store. So, so many photos would have it in the background!")
	DL.prog_text()
	await DL.advance_text
	DL.swap_dialogue("I could have been saved! My bakery could have been popular!")
	DL.prog_text()
	await DL.advance_text
	
	ANBG.end_anim()
	await ANBG.anim_looped
	ANBG.swap_bg(ANBG.bg_index.priest_kitchen)
	ANBG.set_anim(ANBG.anim_index.kitchen_talk, 4)
	ANBG.loop_anim(4, 0.43)
	DL.swap_name("Father Sidney")
	DL.swap_dialogue("Yet he fell down two blocks away. In front of an abandoned part of town.")
	DL.prog_text()
	await DL.advance_text
	
	ANBG.end_anim()
	await ANBG.anim_looped
	ANBG.swap_bg(ANBG.bg_index.bakerside_kitchen)
	ANBG.set_anim(ANBG.anim_index.baker_talk, 4)
	ANBG.loop_anim(4, 0.43)
	DL.swap_name("Damien")
	DL.swap_dialogue("If... If I just gave him more bagels...")
	DL.prog_text()
	await DL.advance_text
	
	ANBG.end_anim()
	await ANBG.anim_looped
	ANBG.swap_bg(ANBG.bg_index.priest_kitchen)
	ANBG.set_anim(ANBG.anim_index.kitchen_talk, 4)
	ANBG.loop_anim(4, 0.43)
	DL.swap_name("Father Sidney")
	DL.swap_dialogue("Do you even regret what you did?! Look at me in my eyes.")
	DL.prog_text()
	await DL.advance_text
	
	ANBG.end_anim()
	await ANBG.anim_looped
	ANBG.swap_bg(ANBG.bg_index.bakerside_kitchen)
	ANBG.set_anim(ANBG.anim_index.baker_talk, 4)
	ANBG.loop_anim(4, 0.43)
	DL.swap_name("Damien")
	DL.swap_dialogue("I was doing what I had to. But I confessed because I am sorry, deeply, truly sorry.")
	DL.prog_text()
	await DL.advance_text
	
	ANBG.end_anim()
	await ANBG.anim_looped
	ANBG.swap_bg(ANBG.bg_index.priest_kitchen)
	ANBG.set_anim(ANBG.anim_index.kitchen_talk, 4)
	ANBG.loop_anim(4, 0.43)
	DL.swap_name("Roman")
	DL.swap_dialogue("(Nudge)")
	DL.prog_text()
	await DL.advance_text
	DL.swap_name("Father Sidney")
	DL.swap_dialogue("Say it. Confess like you did a few minutes ago.")
	DL.prog_text()
	await DL.advance_text
	
	ANBG.end_anim()
	await ANBG.anim_looped
	ANBG.swap_bg(ANBG.bg_index.bakerside_kitchen)
	ANBG.set_anim(ANBG.anim_index.baker_talk, 4)
	ANBG.loop_anim(4, 0.43)
	DL.swap_name("Damien")
	DL.swap_dialogue("Alright. I sinned, I killed Minister Raisor.")
	DL.prog_text()
	await DL.advance_text
	
	DL.swap_name("Roman")
	DL.swap_dialogue("*Click*    *Whirl*")
	DL.prog_text()
	await DL.advance_text
	
	DL.swap_name("Damien")
	DL.swap_dialogue("Hold on. What was-", true)
	await DL.prog_text()
	DL.swap_dialogue("No...")
	DL.prog_text()
	await DL.advance_text
	
	##Evidence
	ANBG.end_anim()
	await ANBG.anim_looped
	ANBG.swap_bg(ANBG.bg_index.priest_kitchen)
	ANBG.set_anim(ANBG.anim_index.kitchen_evidence, 4)
	ANBG.loop_anim(4, 0.43)
	DL.swap_name("Father Sidney")
	DL.swap_dialogue("Forgot about that? His tape recorder.")
	DL.prog_text()
	await DL.advance_text
	
	ANBG.end_anim()
	await ANBG.anim_looped
	ANBG.swap_bg(ANBG.bg_index.bakerside_kitchen)
	ANBG.set_anim(ANBG.anim_index.baker_talk, 4)
	ANBG.loop_anim(4, 0.43)
	DL.swap_name("Damien")
	DL.swap_dialogue("Doesn't matter. You overwrote the original confession.")
	DL.prog_text()
	await DL.advance_text
	DL.swap_dialogue("How would a jury know that you didn't tell me to say that?")
	DL.prog_text()
	await DL.advance_text
	DL.swap_dialogue("And what the hell is that rat doing here?!")
	DL.prog_text()
	await DL.advance_text
	DL.swap_dialogue("I thought I threw it in the sewers-!")
	DL.prog_text()
	await DL.advance_text
	
	ANBG.end_anim()
	await ANBG.anim_looped
	ANBG.swap_bg(ANBG.bg_index.priest_kitchen)
	ANBG.set_anim(ANBG.anim_index.kitchen_evidence, 4)
	ANBG.loop_anim(4, 0.43)
	DL.swap_name("Father Sidney")
	DL.swap_dialogue("Be nice to the rat alright? And there's two sides on this tape.")
	DL.prog_text()
	await DL.advance_text
	DL.swap_dialogue("Thankfully our little friend here didn't use the original side.")
	DL.prog_text()
	await DL.advance_text
	DL.swap_name("Recorder")
	DL.swap_dialogue("*clunk* Bless me father for I have sinned.")
	DL.prog_text()
	await DL.advance_text
	DL.swap_dialogue("*click* Alright. I sinned, I killed Minister Raisor.")
	DL.prog_text()
	await DL.advance_text
	
	DL.swap_name("Father Sidney")
	DL.swap_dialogue("Cool huh? It's pretty quiet but connecting this to a speaker will do the job.")
	DL.prog_text()
	await DL.advance_text
	
	ANBG.end_anim()
	await ANBG.anim_looped
	ANBG.swap_bg(ANBG.bg_index.bakerside_kitchen)
	ANBG.set_anim(ANBG.anim_index.baker_talk, 4)
	ANBG.loop_anim(4, 0.43)
	DL.swap_name("Damien")
	DL.swap_dialogue("We can forget about this! We can!")
	DL.prog_text()
	await DL.advance_text
	
	DL.swap_name("Roman")
	DL.swap_dialogue("No, we can't. Sidney. It's up to you. What do you want to do?")
	DL.prog_text()
	await DL.advance_text
	
	#bagel
	
	ANBG.end_anim()
	await ANBG.anim_looped
	ANBG.swap_bg(ANBG.bg_index.bagel_shot)
	ANBG.hide_anim()
	DL.swap_name("Father Sidney")
	DL.swap_dialogue("I...")
	DL.prog_text()
	await DL.advance_text
	DL.swap_dialogue("(I feel my decisions influencing me.)")
	DL.prog_text()
	await DL.advance_text
	
	if ALIGNMENT > 0:
		DL.swap_dialogue("(I feel my Lawful duty as an Eye overpowering my Faith.)")
		DL.prog_text()
		await DL.advance_text
		DL.swap_dialogue("Damien Black, You're under citizen's arrest for second degree murder.")
		DL.prog_text()
		await DL.advance_text
		DL.swap_dialogue("Lay flat on the ground until the authorities arrive.")
		DL.prog_text()
		await DL.advance_text
		DL.swap_name("Damien")
		DL.swap_dialogue("You- You can't do this! What about my mother!", true)
		await DL.prog_text()
		DL.swap_name("Father Sidney")
		DL.swap_dialogue("Relax. She'll be transferred to a care home west of here, in Winnipeg.")
		DL.prog_text()
		await DL.advance_text
		DL.swap_name("Roman")
		DL.swap_dialogue("That's the spirit Sidney! Alright I'll call this in and we can talk another time.")
		DL.prog_text()
		await DL.advance_text
		
	else:
		DL.swap_dialogue("(I feel my Faith overpowering my Lawful duty as an Eye.)")
		DL.prog_text()
		await DL.advance_text
		DL.swap_dialogue("Damien. What you did was unforgivable. But I believe you had no ill intent.")
		DL.prog_text()
		await DL.advance_text
		DL.swap_dialogue("You were deeply misguided my child. I understand why you did it.")
		DL.prog_text()
		await DL.advance_text
		DL.swap_name("Damien")
		DL.swap_dialogue("Really- I. I don't know what to say- Thank you so so much-", true)
		await DL.prog_text()
		DL.swap_name("Father Sidney")
		DL.swap_dialogue("Do not mistake my forgiveness for mercy.")
		DL.prog_text()
		await DL.advance_text
		DL.swap_dialogue("You will be working at the church for 28 years, the same amount of time Raisor did.")
		DL.prog_text()
		await DL.advance_text
		DL.swap_dialogue("Your mother will be looked after, in our ward, rest assured.")
		DL.prog_text()
		await DL.advance_text
		DL.swap_name("Damien")
		DL.swap_dialogue("Thank you. Thank you Father Sidney.")
		DL.prog_text()
		await DL.advance_text
		DL.swap_name("Roman")
		DL.swap_dialogue("As much as I believe he should rot in a cell, I trust you Sidney.")
		DL.prog_text()
		await DL.advance_text
		DL.swap_dialogue("Farewell to the both of you.")
		DL.prog_text()
		await DL.advance_text
	
	DL.hide()
	ANBG.anim_state(false)

func law_ending():
	
	#SETUP
	ANBG.unhide_anim()
	ANBG.swap_bg(ANBG.bg_index.beach_end)
	ANBG.set_anim(ANBG.anim_index.beach_walk, 18)
	await ANBG.play_anim_once(18, 0.22)
	
	ANBG.set_anim(ANBG.anim_index.beach_stand, 12)
	ANBG.loop_anim(12, 0.33)
	
	#DIALOGUE START
	DL.show()
	
	DL.swap_name("Sidney")
	DL.swap_dialogue("Thanks for coming to my last sermon yesterday. All the evidence was in order, yes?")
	DL.prog_text()
	await DL.advance_text
	
	DL.swap_name("Roman")
	DL.swap_dialogue("All processed. The trial went... decent. 10 years.")
	DL.prog_text()
	await DL.advance_text
	DL.swap_dialogue("The shock on that bailiff's face when we made the rat testify...")
	DL.prog_text()
	await DL.advance_text
	DL.swap_dialogue("You should've been there!")
	DL.prog_text()
	await DL.advance_text
	
	DL.swap_name("Sidney")
	DL.swap_dialogue("...........")
	DL.prog_text()
	await DL.advance_text
	DL.swap_name("Roman")
	DL.swap_dialogue("Are you good?")
	DL.prog_text()
	await DL.advance_text
	await get_tree().create_timer(2).timeout
	
	DL.swap_name("Roman")
	DL.swap_dialogue("You regret leaving the church, don't you.")
	DL.prog_text()
	await DL.advance_text
	
	DL.swap_name("Sidney")
	DL.swap_dialogue("No. Not at all, but I do look back on it fondly.")
	DL.prog_text()
	await DL.advance_text
	DL.swap_dialogue("Helping people is nothing to be ashamed of.")
	DL.prog_text()
	await DL.advance_text
	DL.swap_dialogue("Raisor would've wanted me to leave.")
	DL.prog_text()
	await DL.advance_text
	
	DL.swap_name("Roman")
	DL.swap_dialogue("We should leave Sandstone behind us.")
	DL.prog_text()
	await DL.advance_text
	DL.swap_name("Sidney")
	DL.swap_dialogue("You think so?")
	DL.prog_text()
	await DL.advance_text
	DL.swap_name("Roman")
	DL.swap_dialogue("The branch in Edmonton has vacancies. I want you to come with me.")
	DL.prog_text()
	await DL.advance_text
	DL.swap_name("Sidney")
	DL.swap_dialogue("A fresh start wouldn't be bad. But where would we live?")
	DL.prog_text()
	await DL.advance_text
	DL.swap_name("Roman")
	DL.swap_dialogue("A cabin in the woods would suffice, just the two of us.")
	DL.prog_text()
	await DL.advance_text
	DL.swap_name("Sidney")
	DL.swap_dialogue("Well it's a lot better than that cramped apartment you have.")
	DL.prog_text()
	await DL.advance_text
	DL.swap_name("Roman")
	DL.swap_dialogue("Yeah. I'll be glad to go outside that box for the last time.")
	DL.prog_text()
	await DL.advance_text
	#END
	DL.hide()
	ANBG.anim_state(false)


func faith_ending():
	
	#SETUP
	ANBG.unhide_anim()
	ANBG.swap_bg(ANBG.bg_index.letter_end)
	ANBG.set_anim(ANBG.anim_index.letter_writing, 9)
	await ANBG.play_anim_once(9, 0.30)
		
	#DIALOGUE START
	DL.show()
	DL.swap_name("Minister Sidney")
	DL.swap_dialogue("Dear Roman, I haven't seen you since my last sermon, I'm glad you came.")
	DL.prog_text()
	await DL.advance_text
	DL.swap_dialogue("Partly because I was offered to become the Minister at the Toronto branch.")
	DL.prog_text()
	await DL.advance_text
	DL.swap_dialogue("But I write to you because I hope one day you'll join me.")
	DL.prog_text()
	await DL.advance_text
	DL.swap_dialogue("You and the rat, of course.")
	DL.prog_text()
	await DL.advance_text
	DL.swap_dialogue("Soon you'll be too old to be an Eye. Leave your comfort zone.")
	DL.prog_text()
	await DL.advance_text
	DL.swap_dialogue("Think Outside the Box for your future.")
	DL.prog_text()
	await DL.advance_text
	DL.swap_dialogue("Many thanks,")
	DL.prog_text()
	await DL.advance_text
	DL.swap_dialogue("Minister Sidney.")
	DL.prog_text()
	await DL.advance_text
	


func placeholder():
	#SETUP
	ANBG.swap_bg(ANBG.bg_index.confess1)
	ANBG.set_anim(ANBG.anim_index.confess1, 3)
	ANBG.loop_anim(3, 0.43)
	
	#DIALOGUE START
	DL.show()
	DL.swap_name("")
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
	#DL.("Whaaaaaaaaaat", "Im the bad one lol")
	#var temp = await DL.get_choice()
	#if temp == 0:
	#	print("cowabunga dude")
	
	#END
	DL.hide()
	ANBG.anim_state(false)
