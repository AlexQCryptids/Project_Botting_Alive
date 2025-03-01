extends Control

var message_template = preload("res://templates/text_message_template.tscn")

@export var reciever_img:Texture
@export var sender_img:Texture

func add_text(time, receiver, msg_text):
	var cur_msg = message_template.instantiate() # Instantiate first
	cur_msg.set_time(time)
	cur_msg.set_message(msg_text)
	if receiver:
		cur_msg.set_image(reciever_img)
	else:
		cur_msg.set_image(sender_img)
	self.add_child(cur_msg)
