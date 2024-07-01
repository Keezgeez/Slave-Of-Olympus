extends CanvasLayer

var lives = 3

signal Died
@onready var slaave = $Slave
@onready var heaaaarts = $Heaaaarts
@onready var killzone = $"."
@onready var pickups = $heartPickups

# Called when the node enters the scene tree for the first time.
func _ready():
	lives = 3

func _process(_delta):
	_updateLife()

func _on_k_illzone_body_entered(body):
	lives -= 1
	print ("-1 life")
	if lives <= 0:
		emit_signal("Died")
	
func _on_heart_pickups_add_heart():
	lives += 1
	print ("+1 life")
	print (lives)
	
func _updateLife():
	if lives == 0:
		get_tree().reload_current_scene()
	if lives == 1:
		heaaaarts.play("1_hart")
	if lives == 2:
		heaaaarts.play("2_hart")
	if lives == 3:
		heaaaarts.play("3_hart")
	if lives == 4:
		heaaaarts.play("4_hart")

func _on_slave_fall():
	lives -= 1
