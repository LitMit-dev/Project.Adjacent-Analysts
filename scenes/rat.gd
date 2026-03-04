extends CharacterBody2D

var col
const SPEED = 340.0
const jump_speed = -590.0
var jumpAvailible = true

var isSinging = false

var text = "_____"

func update_voice():
	$LineEdit.text = $LineEdit.text.remove_chars(" ")
	$LineEdit.caret_column = 5
	for i in range(5):
		if i >= len($LineEdit.text):
			text[i] = "_"
		else:
			text[i] = $LineEdit.text[i]
		get_node("LETTERBOX/" + str(i)).text = text[i]
	

func start_voice():
	$LineEdit.grab_focus()
	$"text anim".play("LETTERS")
	$"speak anim".play("drop")
	await get_tree().create_timer(0.4).timeout
	isSinging = true
	
func end_voice():
	$LineEdit.release_focus()
	$"speak anim".play_backwards("drop")
	await get_tree().create_timer(0.4).timeout
	isSinging = false

func jump():
	velocity.y = jump_speed
	$Rat_Sprite.frame = 1
	jumpAvailible = false

func CoyoteEnd():
	jumpAvailible = false

func _input(event: InputEvent) -> void:
	if event is InputEventKey:
		if event.is_action_pressed("START_SONG") and !isSinging:
			start_voice()
		elif event.is_action_pressed("END_SONG") and isSinging:
			end_voice()
			
func _process(delta: float) -> void:
	if isSinging:
		$LineEdit.grab_focus()
		update_voice()
		for i in [0,1,2,3,4]:
			if i == $LineEdit.caret_column:
				get_node("LETTERBOX/" + str(i)).modulate = Color(1.0, 1.0, 0.0, 1.0)
			else:
				get_node("LETTERBOX/" + str(i)).modulate = Color(1.0, 1.0, 1.0, 1.0)
	

func _physics_process(delta):
	
	if velocity.y <= 0 and !jumpAvailible and is_on_floor():
		jumpAvailible = true
	
	if velocity.y > 0 and !jumpAvailible:
		$Rat_Anims.play("fall")
	elif velocity.y <= 0 and !is_on_floor():
		$Rat_Anims.play("rise")
	

	velocity += get_gravity() * delta

	if Input.is_action_just_pressed("ui_accept") and jumpAvailible and !isSinging:
		jump()
		
	if (!is_on_floor()) and jumpAvailible and $CoyoteTimer.is_stopped():
		$CoyoteTimer.start()
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction and !isSinging:
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
	
	


func text_submit(new_text: String) -> void:
	$LineEdit.grab_focus()
	#fix
