extends Area2D

var death_pos = Vector2.ZERO
@onready var timer = $Timer
@onready var slave = $"../Slave"


func _on_body_entered(body):
	print("You Died")
	timer.start()

func _on_timer_timeout():
	get_tree().reload_current_scene()
