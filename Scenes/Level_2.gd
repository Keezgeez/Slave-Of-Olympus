extends Node2D

@onready var pause_menu = $Slave/Camera2D/PauseMenu
@onready var level_2 = $"."


var paused = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pause_menu.hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("Pause"):
		pause_menuu()
	
func pause_menuu():
	if paused:
		pause_menu.hide()
		Engine.time_scale = 1
	else:
		pause_menu.show()
		Engine.time_scale = 0
		
	paused = !paused
