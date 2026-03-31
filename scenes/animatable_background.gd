extends CanvasLayer

class_name animatedBg

var active_anim = false

signal anim_looped

const bg_index = {
	
	confess1 = "res://assets/priest_case/bgs/priestcase01.png",
	confess2 = "res://assets/priest_case/bgs/priestcase02.png",
	
	cafe_morning = "res://assets/priest_case/bgs/priestcase03.png",
	street_overhead = "res://assets/priest_case/bgs/priestcase04.png",
	drain = "res://assets/priest_case/bgs/priestcase05.png",
	
	spouse_path = "res://assets/priest_case/bgs/priestcase06A.png",
	lab_path = "res://assets/priest_case/bgs/priestcase06B.png",
	
	cafe_day = "res://assets/priest_case/bgs/priestcase07.png",
	cafe_see_rat = "res://assets/priest_case/bgs/priestcase08.png",
	deadend_alley = "res://assets/priest_case/bgs/priestcase09.png",
	bakery_door = "res://assets/priest_case/bgs/priestcase10.png",
	waiting_door = "res://assets/priest_case/bgs/priestcase11.png",
	
	open_door = "res://assets/priest_case/bgs/priestcase12.png",
	desk_shop = "res://assets/priest_case/bgs/priestcase13.png",
	bakerside_kitchen = "res://assets/priest_case/bgs/priestcase14.png",
	priest_kitchen = "res://assets/priest_case/bgs/priestcase14-2.png",
	bagel_shot = "res://assets/priest_case/bgs/priestcase14B.png",
	
	letter_end = "res://assets/priest_case/bgs/priestcase15A.png",
	beach_end = "res://assets/priest_case/bgs/priestcase15B.png",
	
}

const anim_index = {
	NONE = null,
	confess1 = "res://assets/priest_case/anm/priestcase01-curt.png",
	confess2 = "res://assets/priest_case/anm/priestcase02-rev.png",
	show_taperec = "res://assets/priest_case/anm/priestcase03-show.png",
	cafe_speak = "res://assets/priest_case/anm/priestcase03-talk.png",
	drain_drop = "res://assets/priest_case/anm/priestcase05-drop.png",
	spouse_idle = "res://assets/priest_case/anm/priestcase06A-Notalk.png",
	spouse_talk = "res://assets/priest_case/anm/priestcase06A-TALK.png",
	spouse_window = "res://assets/priest_case/anm/priestcase06A-RATSEQ.png",
	lab_idle = "res://assets/priest_case/anm/priestcase06B-NOTALK.png",
	lab_talk = "res://assets/priest_case/anm/priestcase06B-TALK.png",
	cafe_talk2 = "",
	cafe_ratrun = "res://assets/priest_case/anm/priestcase08.png",
	alley_ratchase = "res://assets/priest_case/anm/priestcase09.png",
	door_flap = "res://assets/priest_case/anm/priestcase10.png",
	door_wait = "res://assets/priest_case/anm/priestcase11.png",
	door_unlock = "res://assets/priest_case/anm/priestcase11-unlock.png",
	door_open = "res://assets/priest_case/anm/priestcase12.png",
	bakery_walkin = "res://assets/priest_case/anm/priestcase13A.png",
	bakery_papers = "res://assets/priest_case/anm/priestcase13B.png",
	bakery_noisehear = "res://assets/priest_case/anm/priestcase13C.png",
	baker_getup = "res://assets/priest_case/anm/priestcase14-getup.png",
	baker_caution = "res://assets/priest_case/anm/priestcase14-caution.png",
	baker_talk = "res://assets/priest_case/anm/priestcase14-bakertalk.png",
	kitchen_talk = "res://assets/priest_case/anm/priestcase14-2b.png",
	kitchen_evidence = "res://assets/priest_case/anm/priestcase14-2.png",
	letter_writing = "res://assets/priest_case/anm/priestcase15A.png",
	beach_walk = "res://assets/priest_case/anm/priestcase15B-getthere.png",
	beach_stand = "res://assets/priest_case/anm/priestcase15B-Talk.png",
	
}

func swap_bg(which):
	$BG.texture = load(which)

func set_anim(path, framecount):
	active_anim = false
	$ANIM_LAYER.hide()
	$ANIM_LAYER.frame = 0
	$ANIM_LAYER.texture = load(path)
	$ANIM_LAYER.hframes = framecount
	$ANIM_LAYER.show()
	active_anim = true

func anim_state(state=false):
	active_anim = state

func end_anim():
	active_anim = false
	$ANIM_LAYER.frame = 0

func hide_anim():
	$ANIM_LAYER.hide()

func unhide_anim():
	$ANIM_LAYER.show()

func loop_anim(framecount, persec):
	while active_anim:
		if await play_anim_once(framecount, persec) == 2:
			break
	$ANIM_LAYER.frame = 0
	

func play_anim_once(framecount, persec):
	for i in range(framecount):
		$ANIM_LAYER.frame = i
		await get_tree().create_timer(persec).timeout
		if active_anim == false:
			anim_looped.emit()
			return 2
	
