extends Node2D

signal CheckpointUp

func _on_flags_body_entered(body):
	emit_signal("CheckpointUp")
	$"../Slave".death_pos = position
	$Flag.play("Checkpoint")
	print ("checkpoint")
	
#func _physics_process(delta):
#	$"../Slave".death_pos = position
		
func _on_canine_dog_bite():
	$"../Slave".death_pos = position
	
func get_checkpoint_position() -> Vector2:
	return $"../Slave".death_pos

