extends CharacterBody2D
@export var rat_id = 1
var col
const SPEED = 340.0
const jump_speed = -590.0
var jumpAvailible = true
@export var MAX_TEXT = 4
var isSinging = false
var MenuActive = false
var transing = false
var lettertrans = false
var alert = [false, ""]

const menuify = {
	
	HINTS_OFF="[color=#FF0000](DISABLED)[/color]",
	HINTS_ON="[color=#00FF00](ENABLED)[/color]",
	MUSIC_OFF="[color=#FF0000](OFF)[/color]",
	MUSIC_ON="[color=#00FF00](ON)[/color]"
	
}

@export var baseZ = 5

var text = "_____"

func smooth_out():
	z_index = 99
	transing = true
	MSC.fade_in()
	$Transitor.play("fade_in")
	

func smooth_in():
	z_index = baseZ
	MSC.fade_out()
	$Transitor.play_backwards("fade_in")
	transing = false

func update_voice():
	$LineEdit.text = $LineEdit.text.remove_chars(" ")
	$LineEdit.text = $LineEdit.text.remove_chars("q")
	$LineEdit.text = $LineEdit.text.remove_chars("Q")
	$LineEdit.caret_column = MAX_TEXT
	for i in range(MAX_TEXT):
		if i >= len($LineEdit.text):
			text[i] = "_"
		else:
			text[i] = $LineEdit.text[i]
		get_node("LTR_PARENT/LETTERBOX/" + str(i)).text = text[i]
	

func menu_open():
	if rat_id != globdat.cur_rat:
		return
	$"speak anim".play("menu open")
	await get_tree().create_timer(0.4).timeout
	MenuActive = true
	
func menu_close():
	$"speak anim".play_backwards("menu open")
	await get_tree().create_timer(0.4).timeout
	MenuActive = false
	
func start_voice():
	
	if !globdat.has_tape_rec or rat_id == 2 or rat_id == 6 or rat_id != globdat.cur_rat or MenuActive or lettertrans:
		
		return
	$LTR_PARENT/LETTERBOX.show()
	$"text anim".play("LETTERS")
	$"speak anim".play("drop")
	lettertrans = true
	await get_tree().create_timer(0.5).timeout
	lettertrans = false
	isSinging = true
	text = ""
	for i in range(MAX_TEXT):
		text += "_"
	$LineEdit.grab_focus()
	
func end_voice():
	if rat_id != globdat.cur_rat or lettertrans:
		return
	$LineEdit.release_focus()
	$"speak anim".play_backwards("drop")
	lettertrans = true
	await get_tree().create_timer(0.4).timeout
	isSinging = false
	await get_tree().create_timer(0.1).timeout
	lettertrans = false
	$LTR_PARENT/LETTERBOX.hide()
	$LineEdit.text = ""
	text = ""
	for i in range(MAX_TEXT):
		text += "_"
	update_voice()

func jump():
	velocity.y = jump_speed
	$Rat_Sprite.frame = 1
	jumpAvailible = false

func CoyoteEnd():
	jumpAvailible = false

func _input(event: InputEvent) -> void:
	if event is InputEventKey:
		if event.is_action_pressed("START_SONG") and !isSinging and !MenuActive:
			start_voice()
		elif event.is_action_pressed("END_SONG") and isSinging:
			end_voice()
		elif event.is_action_pressed("hints") and MenuActive:
			globdat.settings.HINTS = !globdat.settings.HINTS 
		elif event.is_action_pressed("musictog") and MenuActive:
			globdat.settings.MUSIC = !globdat.settings.MUSIC
		elif event.is_action_pressed("exit") and MenuActive:
			get_tree().call_deferred("change_scene_to_file", "res://scenes/main.tscn")
		elif event.is_action_pressed("menutog") and !MenuActive and !isSinging:
			menu_open()
		elif event.is_action_pressed("menutog") and MenuActive:
			menu_close()
			
func _ready() -> void:
	$menu/TR.text = "[b]MENU[/b]\n[H] - BACKGROUND HINTS " + [menuify.HINTS_OFF, menuify.HINTS_ON][int(globdat.settings.HINTS)] + "\n[T] - TOGGLE MUSIC " + [menuify.MUSIC_OFF, menuify.MUSIC_ON][int(globdat.settings.MUSIC)] + "\n[ESC] - QUIT TO MAIN MENU\n[color=#FF4444](PROGRESS IS NOT SAVED)[/color]"
	
	$LineEdit.max_length = MAX_TEXT
	for i in range(5):
		if i >= MAX_TEXT:
			get_node("LTR_PARENT/LETTERBOX/" + str(i)).hide()
			get_node("LTR_PARENT").position.x += 17 
			
	if rat_id == 2 or rat_id == 6:
		$LTR_PARENT/LETTERBOX.hide()
	
func _process(_delta: float) -> void:
	if MenuActive:
		$menu/TR.text = "[b]MENU[/b]\n[H] - BACKGROUND HINTS " + [menuify.HINTS_OFF, menuify.HINTS_ON][int(globdat.settings.HINTS)] + "\n[T] - TOGGLE MUSIC " + [menuify.MUSIC_OFF, menuify.MUSIC_ON][int(globdat.settings.MUSIC)] + "\n[ESC] - QUIT TO MAIN MENU\n[color=#FF4444](PROGRESS IS NOT SAVED)[/color]"
	
	$POPUP.visible = alert[0]
	$POPUP.text = alert[1]
	if isSinging:
		update_voice()
		for i in [0,1,2,3,4]:
			if i == $LineEdit.caret_column:
				get_node("LTR_PARENT/LETTERBOX/" + str(i)).modulate = Color(1.0, 1.0, 0.0, 1.0)
			else:
				get_node("LTR_PARENT/LETTERBOX/" + str(i)).modulate = Color(1.0, 1.0, 1.0, 1.0)


func _physics_process(delta):
	if velocity.y <= 0 and !jumpAvailible and is_on_floor():
		jumpAvailible = true
	
	if velocity.y > 0 and !jumpAvailible:
		$Rat_Anims.play("fall")
	elif velocity.y <= 0 and !is_on_floor():
		$Rat_Anims.play("rise")
	
	velocity += get_gravity() * delta
	
	$TR.visible = (globdat.cur_rat == rat_id and (rat_id != 2 and rat_id != 6)) and globdat.has_tape_rec and !transing
	$TR2.visible = globdat.cur_rat == rat_id and !transing
	
	if globdat.cur_rat != rat_id:
		$Rat_Anims.play("idle")
		move_and_slide()
		return

	if Input.is_action_just_pressed("ui_accept") and jumpAvailible and !isSinging and !MenuActive:
		jump()
		
	if (!is_on_floor()) and jumpAvailible and $CoyoteTimer.is_stopped():
		$CoyoteTimer.start()
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if direction and !isSinging and !MenuActive:
		velocity.x = direction * SPEED
		$Rat_Sprite.flip_h = velocity.x > 0
		if get_real_velocity() == Vector2(0,0):
			$Rat_Anims.play("idle")
		if is_on_floor_only():
			$Rat_Anims.play("run")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		if is_on_floor_only():
			$Rat_Anims.play("idle")
	
	move_and_slide()


func check_text(new_text: String) -> void:
	#var caret = $LineEdit.caret_column
	
	$LineEdit.text = new_text.remove_chars("E")
	$LineEdit.text = new_text.remove_chars("e")
	
