extends Node2D

var dialouge = preload("res://ending_dialouge.tscn")

func _ready():
	var d = dialouge.instantiate()
	add_child(d)
