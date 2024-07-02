extends Node2D

var messages = [
	"My Lightning Coins Fell on the face of the EARTH!" , 
	"Collect all my Lightning Coins to claim your freedom!!"
]

var typing_speed = .1
var read_time = 2

var current_message = 0
var display = ""
var current_char = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	start_dialogue()
	
func start_dialogue():
	current_message = 0
	display = ""
	current_char = 0
	
	$Label/next_char.set_wait_time(typing_speed)
	$Label/next_char.start()

func stop_dialogue():
	get_parent().remove_child(self)
	queue_free()

func _on_next_char_timeout():
	if (current_char < len(messages[current_message])):
		var next_char = messages[current_message][current_char]
		display += next_char
		
		$Label.text = display
		current_char += 1
	else:
		$Label/next_char.stop()
		$Label/next_message.one_shot = true
		$Label/next_message.set_wait_time(read_time)
		$Label/next_message.start()
		
	

func _on_next_message_timeout():
	if (current_message == len(messages) - 1):
		_on_next_scene_timeout()
	else:
		current_message += 1
		display = ""
		current_char = 0
		$Label/next_char.start()


func _on_next_scene_timeout():
	if (current_message == len(messages) - 1):
		get_tree().change_scene_to_file("res://Scenes/tutorial.tscn")
	else:
		current_message += 1
		display = ""
		current_char = 0
		$Label/next_char.start()
		
	
