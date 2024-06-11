extends CharacterBody2D


<<<<<<< HEAD
const SPEED = 300.0
=======
const SPEED = 250.0
>>>>>>> Topepipopuu
const JUMP_VELOCITY = -500.0

var is_jumping = false
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var slaave = $Slaave

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	
	if direction == 0:
		slaave.play("Idle")
	elif direction > 0:
		slaave.play("RunRight")
	else:
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

	move_and_slide()
