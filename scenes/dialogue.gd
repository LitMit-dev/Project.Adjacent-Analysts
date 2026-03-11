extends CanvasLayer

var textProg = 0

func prog_text():
	for i in range(len($Text.text)):
		$Text.visible_characters += 1
		await get_tree().create_timer(0.07).timeout

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
	change_multiple("Bowie", "But whooooooooooooo\nWill love alladin saane?")


#example:
#
#change_multiple("Che", "Cormak")
#await prog_text()
#
#
