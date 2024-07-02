extends Control

@onready var level_2 = $"../../../"

func _on_resume_pressed():
	level_2.pause_menuu()

func _on_return_pressed():
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
