extends Control

@onready var level_1 = $"../../../"


func _on_resume_pressed():
	level_1.pause_menuu()

func _on_return_to_main_menu_pressed():
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")

