extends Area2D

#var collected = false

func _on_body_entered(body):
	#if not collected:
	#	$AudioStreamPlayer2D.play()
	#	print("+1 coin")
	#	hide()
	#	collected = true
		# Disable collision
		
		if body.name == "Slave":
			var tween = create_tween()
			
			tween.tween_property(self, "position", position + Vector2(0, -30), 0.5)
			
			tween.tween_property(self, "modulate:a", 0.0, 0.5)
			
			$AudioStreamPlayer2D.play()
			print("+1 coin")
			
			tween.tween_callback(self.queue_free)
