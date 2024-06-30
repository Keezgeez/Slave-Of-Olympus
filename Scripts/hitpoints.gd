extends CanvasLayer

var lives = 2
var FinalHeart: AnimatedSprite2D  # Declare Harthart as an AnimatedSprite

# Called when the node enters the scene tree for the first time.
func _ready():
	FinalHeart = $FinalHeart  # Assign the AnimatedSprite node named Harthart
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
			FinalHeart.animation = "default"
			FinalHeart.play()
		3:
			FinalHeart.animation = "new_animation"
			FinalHeart.play()
		2:
			FinalHeart.animation = "new_animation_1"
			FinalHeart.play()
		1:
			FinalHeart.animation = "new_animation_2"
			FinalHeart.play()
		0:
			FinalHeart.animation = "new_animation_3"
			FinalHeart.play()



	 # Replace with function body.



