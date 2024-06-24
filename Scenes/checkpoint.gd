extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_flags_body_entered(body):
	$Flag.play("Checkpoint")
	print ("mama mo")
