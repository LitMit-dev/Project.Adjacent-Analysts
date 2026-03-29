extends Area2D

enum actions {
	
	SPEAK = 0,
	END_PUZZLE
	
}

var active = true

var inside = false
@export var word: String = ""
@export var actionID: int = 0
@export var bodyLink: CharacterBody2D
@export var additional_links: Array

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if inside and active:
		logic()

func logic():
	if bodyLink.text.capitalize() == word.capitalize() and actionID == 0 and !bodyLink.isSinging:
		print("AA")
		if word == "SWAP":
			globdat.cur_rat = additional_links[0]
		inside = false
		if word == "MOCHA":
			get_node(additional_links[0]).monitoring = true
		if word == "19621":
			get_node(additional_links[0]).frame = 1
			get_node(additional_links[1]).disabled = !get_node(additional_links[1]).disabled
			get_node(additional_links[2]).monitoring = false
		if word == "DAISY":
			get_node(additional_links[1]).disabled = !get_node(additional_links[1]).disabled
			get_node(additional_links[2]).monitoring = false
			for i in range(6):
				await get_tree().create_timer(0.3).timeout
				get_node(additional_links[0]).frame += 1
		active = false
			
	elif actionID == 1:
		get_node(additional_links[0]).frame = 1
		get_node(additional_links[1]).disabled = !get_node(additional_links[1]).disabled
		globdat.cur_rat = additional_links[2]
		inside = false
		active = false
		get_node(additional_links[3]).monitoring = false
	elif actionID == 2:
		inside = false
		monitoring = false
		bodyLink.smooth_out()
		
		await get_tree().create_timer(0.8).timeout
		await get_parent().get_parent().talk(additional_links[2])
		get_node(additional_links[1]).smooth_in()
		bodyLink.menu_close()
		bodyLink.end_voice()
		active = false
		if additional_links[0] is int:
			globdat.cur_rat = additional_links[0]
		else:
			get_tree().call_deferred("change_scene_to_file", additional_links[0])

func enterArea(body: Node2D) -> void:
	if "Rat" not in body.name: return
	inside = true

func exitArea(body: Node2D) -> void:
	if "Rat" not in body.name: return
	inside = false
