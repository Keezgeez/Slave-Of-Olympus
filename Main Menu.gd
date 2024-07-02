extends Control

func _ready():
	$AudioStreamPlayer2D.play()

func _on_play_pressed():
	get_tree().change_scene_to_file("res://Scenes/main_menuOptions.tscn")
	$AudioStreamPlayer2D.play()
	

func _on_how_to_play_pressed():
	
	get_tree().change_scene_to_file("res://Scenes/CutScene.tscn")


func _on_quit_pressed():
	
	get_tree().quit()

	

