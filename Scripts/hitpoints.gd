extends CanvasLayer

var lives = 4
var Harthart: AnimatedSprite2D  # Declare Harthart as an AnimatedSprite

# Called when the node enters the scene tree for the first time.
func _ready():
	Harthart = $Harthart  # Assign the AnimatedSprite node named Harthart
	updateAnimation()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_k_illzone_body_entered(body):
	lives -= 1
	updateAnimation()

func updateAnimation():
	match lives:
		4:
			Harthart.animation = "default"
			Harthart.play()
		3:
			Harthart.animation = "3lives"
			Harthart.play()
		2:
			Harthart.animation = "2lives"
			Harthart.play()
		1:
			Harthart.animation = "1life"
			Harthart.play()
		0:
			Harthart.animation = "NoLife"
			Harthart.play()
