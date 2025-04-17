extends Control

@onready var hidden_text = $messageHidden
@onready var text_message = $VBoxContainer/TextureRect/MarginContainer/message
@onready var text_time = $VBoxContainer/time
@onready var text_img = $"VBoxContainer/TextureRect"

@onready var receiver_img = preload("res://Assets/Message_app/sprites/text_sprite1.png")
@onready var sender_img = preload("res://Assets/Message_app/sprites/text_sprite3.png")

	
func set_time(time):
	if time == "":
		text_time.visible = false
	else:
		text_time.text = time

func set_message(message):
	text_message.clear()
	text_message.custom_minimum_size.x = 450  # or whatever max width you want
	hidden_text.text = message
	text_message.append_text(message)
	
	await get_tree().process_frame
	
	var text_height = text_message.get_content_height()
	var text_width = text_message.get_content_width()
	
	# Limit width so wrapping happens, height grows as needed
	#text_message.custom_minimum_size.y = text_height
	#print(text_height)
	text_img.custom_minimum_size = Vector2(text_message.custom_minimum_size.x,text_height)  + Vector2(10, 20)
	print(text_img.custom_minimum_size.y)
	self.custom_minimum_size.y = text_img.custom_minimum_size.y
	

func set_type(receiver):
	# make the sprite & text alignment correct
	if receiver:
		text_img.texture = receiver_img
		text_time.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
		text_message.horizontal_alignment = HORIZONTAL_ALIGNMENT_LEFT
		text_img.size_flags_horizontal = SizeFlags.SIZE_SHRINK_END
		
	else:
		text_img.texture = sender_img
		text_time.horizontal_alignment = HORIZONTAL_ALIGNMENT_LEFT
		text_message.horizontal_alignment = HORIZONTAL_ALIGNMENT_LEFT
		text_img.size_flags_horizontal = SizeFlags.SIZE_SHRINK_BEGIN
		

'''		
func set_message_origin(message):
	hidden_text.text = message
	text_message.text = message
	
	
	text_img.custom_minimum_size.x = min(message.length() * 7,500)
	text_message.custom_minimum_size.x = min(message.length() * 30,1000)
	text_img.custom_minimum_size.y = hidden_text.get_line_count() * 12 + 25
	
	#text_message.add_theme_font_size_override("font_size",(280/(min(message.length() * 8,280))) * 8)
	self.custom_minimum_size.y = hidden_text.get_line_count() * 12
'''
