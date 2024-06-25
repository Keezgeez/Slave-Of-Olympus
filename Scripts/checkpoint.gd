extends Node2D

var player = null
var activeFlag = null
var checkpointPosition =  Vector2(-9, -90)
# Called when the node enters the scene tree for the first time.
func _ready():
	player = $"../Slave"


func _on_flags_body_entered(body):
		$Flag.play("Checkpoint")
		
