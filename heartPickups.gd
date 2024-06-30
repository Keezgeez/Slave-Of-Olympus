extends Node2D

signal addHeart

@onready var hitpoints = $Hitpoints

func _on_area_2d_body_entered(body):
	$AnimatedSprite2D.play("default")
	if body.name == "Slave":
		emit_signal("addHeart")
		queue_free()
