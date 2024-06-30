extends Node2D

var lives = 1

@onready var hitpoints = $Hitpoints

func _on_area_2d_body_entered(body):
	$AnimatedSprite2D.play("default")
	if body.name == "Slave":
		
		lives += 1
		print(lives)
		hitpoints.lives = lives
		
		queue_free()
