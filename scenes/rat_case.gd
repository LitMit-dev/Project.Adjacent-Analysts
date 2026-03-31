extends Node2D

@export var DL: dialogue

const RAT_DIALOGUE = {
	
	"0"=["And the rat climbed, for it had nowhere else to go.", 
		"Up the pipe, wondering, why it was there in the first place.", 
		"But the rat felt the importance of the device.", 
		"It persisted upwards, until a crack of opportunity allowed its freedom." 
		],
		
	"1"=["It was drawn in by the half-familiar smell. Yet again the rat found itself driven by the strive to continue.", 
		"So it knew to try and garner attention.", 
		"That was its method to find the owner of the device.",
		],
	
	"2"=["The rat was piecing its memory back together little by little. It had remembered why it was put in that box.",
		"During which, it found success, it found two people who were deeply interested. They wanted to help.", 
		"The rat may finally return the device, and find home."
		],
	
	"3"=[
		"Thus, I conclude the story of the rat.", 
		"In summary.", 
		"The rat found itself lost, in a box, grasping for any familiarity.", 
		"Yet it had a heart, a heart of which was more caring than most.", 
		"It had donned the duty of finding the owner of the device, whilst trying to solve the case of its own identity.",
		"The rat never knew the owner was long gone. It never truly had a home either.",
		"Yet, I strive to be the rat. We all, should strive to have its level of courage.", 
		"And so today marks my final day here in this church.",
		"Sandstone is like our box, we feel trapped but we can leave at any time.",
		"I encourage you all to do the same as the rat, find your way Outside The Box. Follow yourself.",
		"Thank you all."
		]
}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	DL.not_active = true
	DL.ratify()
	DL.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	get_node("Rat" + str(globdat.cur_rat)).get_node("Camera2D").make_current()
	get_node("Hints").visible = globdat.settings.HINTS

func talk(num):
	DL.not_active = false
	DL.show()
	for i in RAT_DIALOGUE[str(num)]:
		DL.swap_dialogue(i, true)
		await DL.prog_text()
		await get_tree().create_timer(1.5).timeout
	DL.not_active = true
	DL.hide()
