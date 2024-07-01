extends CharacterBody2D

const SPEED = 200.0
const JUMP_VELOCITY = -400.0

var is_jumping = false
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var death_pos = Vector2 (-145 , -77)
signal Fall


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
		slaave.play("Jump")
		velocity.y = JUMP_VELOCITY
		is_jumping = true
		
	if Input.is_action_just_pressed("ui_right") and is_on_floor():
		slaave.play("RunRight")
		
	if Input.is_action_just_pressed("ui_left") and is_on_floor():
		slaave.play("RunLeft")
		
	if is_on_floor():
		is_jumping = false

			
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	if position.y > 500:
		position = death_pos
		emit_signal("Fall")
		
		

	move_and_slide()



func _on_killzone_check_p():
	position = death_pos


func _on_canine_2_bite():
	get_tree().reload_current_scene()
