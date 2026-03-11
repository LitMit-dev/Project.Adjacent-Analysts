extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	globdat.cur_rat = 4


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	get_node("Rat" + str(globdat.cur_rat)).get_node("Camera2D").make_current()
