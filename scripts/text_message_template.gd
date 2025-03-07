extends Control

@onready var hidden_text = $messageHidden
@onready var text_message = $VBoxContainer/TextureRect/message
@onready var text_time = $VBoxContainer/time
@onready var text_img = $"VBoxContainer/TextureRect"

@onready var reciever_img = preload("res://rsc/img/text_sprite.png")
@onready var sender_img = preload("res://rsc/img/text_sprite2.png")

func set_time(time):
	text_time.text = time

func set_message(message):
	hidden_text.text = message
	text_message.text = message
	
	text_img.custom_minimum_size.x = (message.length() * 14) + 10

func set_type(reciever):
	
	if reciever:
		text_img.texture = reciever_img
		text_time.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
		text_message.horizontal_alignment = HORIZONTAL_ALIGNMENT_LEFT
		text_img.size_flags_horizontal = SizeFlags.SIZE_SHRINK_END
	else:
		text_img.texture = sender_img
		text_time.horizontal_alignment = HORIZONTAL_ALIGNMENT_LEFT
		text_message.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
		text_img.size_flags_horizontal = SizeFlags.SIZE_SHRINK_BEGIN
