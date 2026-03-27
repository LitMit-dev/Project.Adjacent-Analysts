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
		if word == "SWAP_":
			globdat.cur_rat = additional_links[0]
		inside = false
	elif actionID == 1:
		get_node(additional_links[0]).frame = 1
		get_node(additional_links[1]).disabled = !get_node(additional_links[1]).disabled
		globdat.cur_rat = additional_links[2]
		inside = false
		get_node(additional_links[3]).monitoring = false

func enterArea(body: Node2D) -> void:
	if "Rat" not in body.name: return
	inside = true

func exitArea(body: Node2D) -> void:
	if "Rat" not in body.name: return
	inside = false
