extends Area2D

@onready var timer = $Timer
var startPosition: Vector2 = Vector2(0, 0)  # Set the reset position to (0, 0)

func _ready():
	startPosition = position  # Store the initial position of the Area2D

func _on_body_entered(body):
	print("You Died")
	timer.start()

func _on_timer_timeout():
	# Reset player's position to the stored initial position (0, 0)
	position = startPosition
	print("Resetting position to:", position)  # Optional: Print the position to debug

