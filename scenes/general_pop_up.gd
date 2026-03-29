extends Area2D



var active = true

var inside = false
@export var ID: int
@export var text: String = ""
@export var bodyLink: CharacterBody2D
@export var action: String
@export var trapLink: Node2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if inside and active:
		logic()
		

func logic():
	if bodyLink.transing:
		exitArea(bodyLink)
	if action == "" or trapLink == null:
		return
	
	if Input.is_action_just_pressed(action):
		if ID == 2:
			get_tree().paused = !get_tree().paused 
			trapLink.visible = !trapLink.visible 
			return
		trapLink.monitoring = true
	
	
func enterArea(body: Node2D) -> void:
	if "Rat" not in body.name or bodyLink.transing: return
	bodyLink.alert = [true, text]
	inside = true

func exitArea(body: Node2D) -> void:
	if "Rat" not in body.name: return
	bodyLink.alert = [false, ""]
	inside = false
