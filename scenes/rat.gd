extends CharacterBody2D


const SPEED = 340.0
const jump_speed = -590.0
var jumpAvailible = true

func jump():
	velocity.y = jump_speed
	$Rat_Sprite.frame = 1
	jumpAvailible = false

func CoyoteEnd():
	jumpAvailible = false

func _physics_process(delta):
	if velocity.y <= 0 and !jumpAvailible and is_on_floor():
		jumpAvailible = true
	
	if velocity.y > 0 and !jumpAvailible:
		$Rat_Anims.play("fall")
	elif velocity.y <= 0 and !is_on_floor():
		$Rat_Anims.play("rise")
	

	velocity += get_gravity() * delta

	if Input.is_action_just_pressed("ui_accept") and jumpAvailible:
		jump()
		
	if (!is_on_floor()) and jumpAvailible and $CoyoteTimer.is_stopped():
		$CoyoteTimer.start()

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
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
