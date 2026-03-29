extends Area2D



var active = true

var inside = false

@export var Nodrach_Type: String = ""
@export var Issue: String = ""
@export_multiline() var text: String = ""
@export var color: Color
@export var bodyLink: CharacterBody2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if inside and active:
		logic()
		

func logic():
	if Input.is_action_just_pressed("read") and !NPP.midanim:
		if !NPP.instanced:
			NPP.instance(color, Nodrach_Type, Issue, text)
			return
		NPP.destroy(Nodrach_Type)
	
	
func enterArea(body: Node2D) -> void:
	if "Rat" not in body.name or bodyLink.transing: return
	bodyLink.alert = [true, "[color=#ff0000][R][/color] READ"]
	inside = true

func exitArea(body: Node2D) -> void:
	if "Rat" not in body.name: return
	bodyLink.alert = [false, ""]
	inside = false
