extends CanvasLayer
#0.07
const letpersec = 0.03

const ninepatch_colors = {
	blue="res://assets/priest_case/blue9patch text.png",
	red="",
	grey=""
}

signal advance_text

var no_echo = false

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
	textEnd = true
	indicating = true
	indic_anim()
	ready_next = true

func swap_name(newName: String):
	$Name.text = newName

func swap_dialogue(newText: String):
	$Text.text = newText
	textProg = 0

func swap_portrait(character: String, expression: String):
	$Portraitmask/icon.texture = load(character+"-"+expression)

func swap_textbox(color):
	$NinePatchRect.texture = load(color)
	
func change_multiple(text="", expression="", charName="", charId=""):
	if text != "":
		swap_dialogue(text)
	if charName != "":
		swap_name(charName)
	if expression != "":
		swap_portrait(charId, expression)


# Called when the node enters the scene tree for the first time.
	

func _input(event: InputEvent) -> void:
	if event is InputEventKey and !no_echo:
		no_echo = true
		if ready_next:
			next_part()
		elif !textEnd:
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
	
	if indicating:
		$next_indic.visible = true
		return
#example:
#
#change_multiple("Che", "Cormak")
#await prog_text()
#
#
