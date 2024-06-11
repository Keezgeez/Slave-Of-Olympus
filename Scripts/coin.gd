extends Area2D

var collected = false

func _on_body_entered(body):
	if not collected:
		$AudioStreamPlayer2D.play()
		print("+1 coin")
		hide()
		collected = true
		# Disable collision
