extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	globdat.reset()
	MSC.set_file(MSC.paths.main)
	MSC.safe_play()
	if globdat.complete[0]:
		$POPUP.text += "\n(Complete!)"
	if globdat.complete[1]:
		$POPUP2.text += "\n(Complete!)"

func _input(event: InputEvent) -> void:
	if event is InputEventKey:
		if event.is_action_pressed("down"):
			get_tree().call_deferred("change_scene_to_file", "res://scenes/priest_case.tscn")
		if event.is_action_pressed("read"):
			get_tree().call_deferred("change_scene_to_file", "res://scenes/rat_case.tscn")
