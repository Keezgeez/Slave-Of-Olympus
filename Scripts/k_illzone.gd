extends Area2D

var player = null
var respawnPosition = Vector2(-148, -46)

@onready var timer = $Timer

func _ready():
	player = $"../Slave"

func _on_body_entered(body):
	if body == player:
		print("You Died")
		respawnPlayer()

func respawnPlayer():
	player.position = respawnPosition
	timer.start()

