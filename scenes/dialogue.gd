extends CanvasLayer
#0.07

class_name dialogue

const letpersec = 0.03

var choice = -1
var is_choosing = false
var indicating_blocked = false

signal option_chosen

const ninepatch_colors = {
	blue="res://assets/priest_case/blue9patch text.png",
	red="",
	grey=""
}

signal advance_text

var not_active = false
var no_echo = false
var follow_along = false

var indicating = false
var textEnd = false
var ready_next = false
var textProg = 0

func prog_text():
	$Text.visible_characters = 0
	for i in range(len($Text.text) + 1):
		$Text.visible_characters += 1
		
 
		if $Text.text[i-1] != " " and !textEnd:
			await get_tree().create_timer(letpersec).timeout
		if globdat.path == "Rat" and $Text.text[i-1] != " " and !textEnd:
			SFX.sfx("say")
		if $Text.text[i-1] == "," and !textEnd:
			await get_tree().create_timer(letpersec*3).timeout
		if $Text.text[i-1] == "." and !textEnd:
			await get_tree().create_timer(letpersec*5).timeout
	textEnd = true
	indicating = true
	indic_anim()
	ready_next = true
	if follow_along:
		next_part()

func swap_name(newName: String):
	$Name.text = newName
	var icon = $Portraitmask/icon
	if newName == "Roman":
		icon.texture = load("res://assets/priest_case/badges/Eye.png")
	elif newName == "Father Sidney":
		icon.texture = load("res://assets/priest_case/badges/badgefaith1.png")
	elif newName == "Sidney":
		icon.texture = load("res://assets/priest_case/badges/SidEye.png")
	elif newName == "Doctor Edel":
		icon.texture = load("res://assets/priest_case/badges/Doctor.png")
	elif newName == "Rat" or newName == "Recorder":
		icon.texture = load("res://assets/priest_case/badges/ratund.png")
	elif newName == "Minister Sidney":
		icon.texture = load("res://assets/priest_case/badges/badgefaith2.png")
	elif newName == "Damien":
		icon.texture = load("res://assets/priest_case/badges/murderer.png")
	elif newName == "???":
		icon.texture = load("res://assets/priest_case/badges/a.png")
	else:
		icon.texture = null

func swap_dialogue(newText: String, noskip=false):
	$Text.text = newText
	textProg = 0
	if noskip:
		follow_along = true
	else:
		follow_along = false

func swap_portrait(character: String, expression: String):
	$Portraitmask/icon.texture = load(character+"-"+expression)

func ratify():
	globdat.path = "Rat"
	offset.x = -52.5
	$Text.show()
	$next_indic.hide()
	$NinePatchRect.hide()
	$icon2.hide()
	$Portraitmask.hide()
	$Name.hide()
	
func priestify():
	globdat.path = "Priest"
	offset.x = 0
	$Text.show()
	$NinePatchRect.show()
	$icon2.show()
	$Portraitmask.show()
	$Name.show()

func swap_textbox(color):
	$NinePatchRect.texture = load(color)
	
func change_multiple(text="", expression="", charName="", charId=""):
	if text != "":
		swap_dialogue(text)
	if charName != "":
		swap_name(charName)
	if expression != "":
		swap_portrait(charId, expression)


func create_choices(a: String, b: String):
	is_choosing = true
	$next_indic.hide()
	$Text.hide()
	$Name.hide()
	$Portraitmask.hide()
	$icon2.hide()
	$Choices.show()
	$"Choices/0".text = "[Q] - [Faithful]\n" + a
	$"Choices/1".text = "[E] - [Lawful]\n" + b

func get_choice():
	await option_chosen
	var opt = choice
	destroy_choices()
	return opt

func destroy_choices():
	is_choosing = false
	choice = -1
	$Text.show()
	$Name.show()
	$Portraitmask.show()
	$icon2.show()
	$Choices.hide()
	$"Choices/0".text = ""
	$"Choices/1".text = ""
	

# Called when the node enters the scene tree for the first time.
	

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("menutog") and globdat.path == "Priest":
		globdat.settings.MUSIC = !globdat.settings.MUSIC
		return
	elif event.is_action_pressed("hints")  and globdat.path == "Priest":
		globdat.dialstagisma[1] = !globdat.dialstagisma[1]
		globdat.dialstagisma[2] = 0
		return
	elif event.is_action_pressed("exit") and globdat.path == "Priest":
		if globdat.dialstagisma[1]:
			return
		if globdat.dialstagisma[2] == 1:
			get_tree().call_deferred("change_scene_to_file", "res://scenes/main.tscn")
		globdat.dialstagisma[2] += 1
		
		return
		
	if not_active or event.is_action_released("exit") or event.is_action_released("hints") or event.is_action_released("menutog"):
		return
		
	if event is InputEventKey and !no_echo:
		
		
		no_echo = true
		
		if is_choosing and event.is_action("END_SONG"):
			choice = 0
			option_chosen.emit()
			
		elif is_choosing and event.is_action("START_SONG"):
			choice = 1
			option_chosen.emit() 
		
		elif ready_next and !is_choosing:
			next_part()
		elif !textEnd and !follow_along and !is_choosing:
			textEnd = true
			indicating = true
			indic_anim()
			ready_next = true
	if event is InputEventKey and event.is_released():
		no_echo=false
		
		
func next_part():
	
	indicating = false
	textEnd = false
	textProg = 0
	ready_next = false
	
	$next_indic.visible = false
	advance_text.emit()
	
func indic_anim():
	
	if indicating and !indicating_blocked:
		$next_indic.visible = true
		return
#example:
#
#change_multiple("Che", "Cormak")
#await prog_text()
#
#
