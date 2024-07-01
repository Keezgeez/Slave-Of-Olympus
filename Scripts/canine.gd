extends Node2D

const SPEED = 60

var direction = 1

signal Bitebite
@onready var ray_cast_right = $RayCastRight
@onready var ray_cast_left = $RayCastLeft
@onready var canine_enemy = $CanineEnemy

func _ready():
	canine_enemy.flip_h = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if ray_cast_left.is_colliding():
		direction = 1
		canine_enemy.flip_h = true
	if ray_cast_right.is_colliding():
		direction = -1
		canine_enemy.flip_h = false
	
	position.x += direction * SPEED * delta

func _on_killzone_body_entered(body):
	canine_enemy.play("Bite")
	emit_signal("Bitebite")
	print ("bitebite")
