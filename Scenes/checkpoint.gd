extends Node2D

var checkpointPosition =  Vector2(-9, -90)
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.d


func _on_flags_body_entered(body):
	if body.has_method("setRespawnPoint"):
		checkpointPosition = global_position  # Update checkpoint position to current flag position
		global_position = checkpointPosition
		body.setRespawnPoint(checkpointPosition)
		$Flag.play("Checkpoint")
		print("Respawn point updated to:", checkpointPosition)
		
