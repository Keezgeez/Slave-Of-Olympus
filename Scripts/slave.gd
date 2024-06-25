extends CharacterBody2D

const SPEED = 200.0
const JUMP_VELOCITY = -400.0

var is_jumping = false
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var respawnPosition = Vector2.ZERO
var jumping_upward = false

@onready var slaave = $Slaave

func _process(delta):
	print (global_position)

func _ready():
	respawnPosition = global_position

func setRespawnPoint(position):
	respawnPosition = position
	print("Respawn point set to:", respawnPosition)
	
func respawn():
	set_position(respawnPosition)
	# Additional logic to reset player state (health, inventory, etc.) if needed

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta

	var direction = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	
	if direction == 0:
		slaave.play("Idle")
		
	elif direction > 0:
		if jumping_upward and not slaave.is_on_floor():
			slaave.play("JumpRight")
		else:
			slaave.play("RunRight")
	elif jumping_upward:
		if slaave != is_on_floor():
			slaave.play("JumpRight")
	elif direction < 0:
		if jumping_upward and not slaave.is_on_floor():
			slaave.play("JumpLeft")
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

