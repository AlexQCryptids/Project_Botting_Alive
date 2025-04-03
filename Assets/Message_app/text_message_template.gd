extends Control

@onready var hidden_text = $messageHidden
@onready var text_message = $VBoxContainer/TextureRect/message
@onready var text_time = $VBoxContainer/time
@onready var text_img = $"VBoxContainer/TextureRect"

@onready var reciever_img = preload("res://Assets/Message_app/sprites/text_sprite1.png")
@onready var sender_img = preload("res://Assets/Message_app/sprites/text_sprite1.png")

	
func set_time(time):
	if time == "":
		text_time.visible = false
	else:
		text_time.text = time

func set_message(message):
	hidden_text.text = message
	text_message.text = message
	
	text_img.custom_minimum_size.x = min(message.length() * 7,500)
	text_message.custom_minimum_size.x = min(message.length() * 30,1000)
	text_img.custom_minimum_size.y = hidden_text.get_line_count() * 12 + 25
	
	#text_message.add_theme_font_size_override("font_size",(280/(min(message.length() * 8,280))) * 8)
	self.custom_minimum_size.y = hidden_text.get_line_count() * 12
	

func set_type(reciever):
	
	if reciever:
		text_img.texture = reciever_img
		text_time.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
		#text_message.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
		text_img.size_flags_horizontal = SizeFlags.SIZE_SHRINK_END
	else:
		text_img.texture = sender_img
		text_time.horizontal_alignment = HORIZONTAL_ALIGNMENT_LEFT
		#text_message.horizontal_alignment = HORIZONTAL_ALIGNMENT_LEFT
		text_img.size_flags_horizontal = SizeFlags.SIZE_SHRINK_BEGIN
