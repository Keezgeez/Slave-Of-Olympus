extends StaticBody2D


@onready var animation_tree = $AnimationTree.get("parameters/playback")

func _on_activation_body_entered(body):
	animation_tree.travel("Regenerate")
	
func back_to_static():
	animation_tree.travel("Static")
