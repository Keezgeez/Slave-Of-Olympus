extends Node2D

var dialogue = preload("res://Scenes/dialogue.tscn")

func _ready():
	var d = dialogue.instantiate()
	add_child(d)
