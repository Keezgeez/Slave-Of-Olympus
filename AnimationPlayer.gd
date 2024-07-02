extends AnimationPlayer


@onready var animationw_tree = $AnimationTree.get("parameters/playback")


func _on_area_2d_body_entered(body: Node) -> void:
	animation_tree.travel("Regenerate")
	
func back_to_static():
	animation_tree.travel("Static")
