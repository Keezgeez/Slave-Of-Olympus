extends Area2D

var player = null
var respawnPosition = Vector2(-148, -46)

@onready var timer = $Timer
	
func _ready():
	player = $"../Slave"

func _on_body_entered(body):
	print("You Died")
	timer.start()

func _on_timer_timeout():
	get_tree().reload_current_scene()
