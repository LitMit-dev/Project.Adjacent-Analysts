extends Area2D

var inside = false
@export var bodyLink: Node2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if inside:
		#SFX.sfx("pickup")
		globdat.has_tape_rec = true
		bodyLink.free()
		free()

func enterArea(body: Node2D) -> void:
	if "Rat" not in body.name: return
	inside = true

func exitArea(body: Node2D) -> void:
	if "Rat" not in body.name: return
	inside = false
