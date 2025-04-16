extends Control

class_name Text

var message_template = load("res://Assets/Message_app/text_scenes/text_message_template.tscn")

@onready var parent = $ScrollContainer/VBoxContainer

func add_text(time, receiver, msg_text):
	var cur_msg = load("res://Assets/Message_app/text_scenes/text_message_template.tscn").instantiate()
	parent.add_child(cur_msg)
	cur_msg.set_time(time)
	cur_msg.set_message(msg_text)
	cur_msg.set_type(receiver)
	
func add_date(time):
	var text = Label.new()
	parent.add_child(text)
	text.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	text.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	text.custom_minimum_size.y = 75
	#text.add_theme_font_size_override("font_size",16)
	
	text.text = time
