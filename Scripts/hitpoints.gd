extends CanvasLayer

var lives = 4
var Harthart: AnimatedSprite2D  # Declare Harthart as an AnimatedSprite

# Called when the node enters the scene tree for the first time.
func _ready():
	$Heaart.text = (": ") + str(lives)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_k_illzone_body_entered(body):
	if lives == 4:
		Harthart.play("")
	lives = lives - 1
	$Heaart.text = (": ") + str(lives)
