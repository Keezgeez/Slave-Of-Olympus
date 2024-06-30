extends CanvasLayer

var lives = 1
signal Died
@onready var slaave = $Slaave
@onready var heaaaarts = $Heaaaarts
@onready var killzone = $"."


# Called when the node enters the scene tree for the first time.
func _ready():
	updateHearts

func updateHearts():
	match lives:
		4:
			heaaaarts.play("4 hart")
		3:
			heaaaarts.play("3 hart")
		2:
			heaaaarts.play("default")
		1:
			heaaaarts.play("1 hart")
		0:
			heaaaarts.play("No hart")
	$Heaart.text = (": ") + str(lives)
	print (lives)


func _on_k_illzone_body_entered(body):
	lives -= 1
	print ("-1 life")
	if lives <= 0:
		emit_signal("Died")
	else:
		updateHearts()
	
	
