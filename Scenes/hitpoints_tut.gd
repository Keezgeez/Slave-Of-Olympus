extends CanvasLayer

var lives = 1

signal Died
@onready var slaave = $Slave
@onready var hearts_tut = $HeartsTut
@onready var killzone = $"."
@onready var pickups = $heartPickups
# Called when the node enters the scene tree for the first time.
func _ready():
	lives = 1
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	_updateLife()
	
func _updateLife():
	if lives == 0:
		get_tree().reload_current_scene()
	if lives == 1:
		hearts_tut.play("1_hart")
	if lives == 2:
		hearts_tut.play("2_hart")
	if lives == 3:
		hearts_tut.play("3_hart")
	if lives == 4:
		hearts_tut.play("4_hart")


func _on_heart_pickups_add_heart():
	lives += 1
	print ("+1 life")
	print (lives)


func _on_killzone_body_entered(body):
	lives -= 1
	print ("-1 life")
	if lives <= 0:
		emit_signal("Died")


func _on_slave_fall():
	lives -= 1


func _on_canine_2_bite():
	lives -= 1
