extends Area2D

var entered = false


func _on_body_entered(body):
	entered = true
	print("detected")


func _on_body_exited(body):
	entered = false
	print("notsodetected")

func _process(delta):
	if entered == true:
		if Input.is_action_just_pressed("ui_select"):
			get_tree().change_scene_to_file("res://Scenes/ending_cut_scene.tscn")
