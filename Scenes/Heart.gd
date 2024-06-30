extends Area2D


# Called when the node enters the scene tree for the first time.

var lives = 2

func _on_body_entered(body):
	if body.name == "Slave":
			queue_free()
			lives += 1
			
			print(lives)
