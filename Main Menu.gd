extends Control




func _on_play_pressed():
	get_tree().change_scene_to_file("res://Scenes/main_menuOptions.tscn")


func _on_how_to_play_pressed():
	get_tree().change_scene_to_file("res://Scenes/game.tscn")


func _on_quit_pressed():
	get_tree().quit()
