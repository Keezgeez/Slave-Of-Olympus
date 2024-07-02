extends CanvasLayer

var lives = 3

signal Died
@onready var slaave = $Slave
@onready var hp_level_1 = $HP_Level1
@onready var killzone = $"."
@onready var pickups = $heartPickups

# Called when the node enters the scene tree for the first time.
func _ready():
	lives = 3

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	_updateLife()
	
func _updateLife():
	if lives == 0:
		get_tree().reload_current_scene()
	if lives == 1:
		hp_level_1.play("1_hart")
	if lives == 2:
		hp_level_1.play("2_hart")
	if lives == 3:
		hp_level_1.play("3_hart")
	if lives == 4:
		hp_level_1.play("4_hart")

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
