extends CanvasLayer
#0.07
const letpersec = 0.03

signal advance_text

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
	indic_anim()
	ready_next = true
	

func swap_name(newName: String):
	$Name.text = newName

func swap_dialogue(newText: String):
	$Text.text = newText
	textProg = 0

func swap_portrait(character: String, expression: String):
	$Portraitmask/icon.texture = load(character+"-"+expression)
	
func change_multiple(text="", expression="", charName="", charId=""):
	if text != "":
		swap_dialogue(text)
	if charName != "":
		swap_name(charName)
	if expression != "":
		swap_portrait(charId, expression)


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	swap_name("Bowie")
	swap_dialogue("But whooooooooooooo\nWill love alladin saane?")
	prog_text()
	await advance_text
	swap_dialogue("Tis a pity she was a whore")
	prog_text()
	await advance_text
	swap_dialogue("Ground control to MAAAAAJor tom")
	prog_text()
	

func _input(event: InputEvent) -> void:
	if event is InputEventKey and event.is_pressed():
		if ready_next:
			next_part()
		elif !textEnd:
			textEnd = true
			indic_anim()
			ready_next = true
		
		
func next_part():
	
	indicating = false
	textEnd = false
	textProg = 0
	ready_next = false
	
	advance_text.emit()
	
func indic_anim():
	if indicating:
		return
	while textEnd:
		$next_indic.visible = true
		await get_tree().create_timer(0.5).timeout
		$next_indic.visible = false
		await get_tree().create_timer(0.5).timeout
#example:
#
#change_multiple("Che", "Cormak")
#await prog_text()
#
#
