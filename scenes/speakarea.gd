extends Area2D

var inside = false
@export var bodyLink: CharacterBody2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if inside:
		if bodyLink.text == globdat.rat_stages[globdat.rat_stage]:
			print("true")

func enterArea(body: Node2D) -> void:
	if "Rat" not in body.name: return
	inside = true

func exitArea(body: Node2D) -> void:
	if "Rat" not in body.name: return
	inside = false
