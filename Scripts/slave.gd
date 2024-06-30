extends CharacterBody2D

const SPEED = 200.0
const JUMP_VELOCITY = -400.0

var is_jumping = false
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var death_pos = Vector2 (-145 , -77)



@onready var slaave = $Slaave

	# Additional logic to reset player state (health, inventory, etc.) if needed

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta

	var direction = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	
	if direction == 0:
		slaave.play("Idle")
		
	elif direction > 0:
		slaave.play("RunRight")
	elif direction < 0:
		slaave.play("RunLeft")
		
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		is_jumping = true

	if is_on_floor():
		is_jumping = false

	if direction == 0:
		if is_jumping:
			slaave.play("Jump")
		else:
			slaave.play("Idle")
	elif direction > 0:
		if is_jumping:
			slaave.play("JumpRight")
		else:
			slaave.play("RunRight")
	else:
		if is_jumping:
			slaave.play("JumpLeft")
		else:
			slaave.play("RunLeft")
			
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	if position.y > 500:
		position = death_pos
		
		
		
		

	move_and_slide()

