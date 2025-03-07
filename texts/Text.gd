extends Control

class_name Text

var message_template = load("res://templates/text_message_template.tscn")

@onready var parent = $ScrollContainer/VBoxContainer

func add_text(time, receiver, msg_text):
	var cur_msg = load("res://templates/text_message_template.tscn").instantiate()
	parent.add_child(cur_msg)
	cur_msg.set_time(time)
	cur_msg.set_message(msg_text)
	cur_msg.set_type(receiver)
	
