extends Node2D

var ALIGNMENT = 0

@export var DL: dialogue
@export var ANBG: animatedBg
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#await confessional()
	await where_first()
	await interviews()
	await placeholder()
	await placeholder()
	await placeholder()
	await placeholder()
	await placeholder()
	

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
	DL.swap_dialogue("I... I'm not sure I can absolve this crime, my chil-", true)
	DL.prog_text()
	
	DL.swap_name("???")
	DL.swap_dialogue("My intent was not malice, and you need not stay professional father.")
	DL.prog_text()
	await DL.advance_text 
	
	DL.swap_name("Father Sidney")
	DL.swap_dialogue("Well, thank you. This defeats the purpose I know... but what is your nam-?", true)
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
	ANBG.play_anim_once(3, 0.43)
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
		DL.swap_name("Roman")
		DL.swap_dialogue("Smart, if it's not the spouse, it's usually a neighbour.")
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
		DL.swap_dialogue("Been a while, hasn't it. Who's the friend Sid'?")
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
		ANBG.set_anim(ANBG.anim_index.spouse_talk, 5)
		ANBG.loop_anim(5, 0.43)
		DL.swap_name("Mary")
		DL.swap_dialogue("I did always warn 'im that all those salted bagels he ate were gonna kill 'im one day.")
		DL.prog_text()
		await DL.advance_text
		ANBG.end_anim()
		await ANBG.anim_looped
		ANBG.set_anim(ANBG.anim_index.spouse_idle, 5)
		
	elif leave_for == 1: #coroner
		
		
		pass
	############ADD OPTION CHOICES
	
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


func rat_chase():
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

func bakery():
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
