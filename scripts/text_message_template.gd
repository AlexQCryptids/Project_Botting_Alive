extends Control



func set_time(time):
	$VBoxContainer/time.text = time

func set_message(message):
	$VBoxContainer/TextureRect/message.text = message

func set_image(image):
	$VBoxContainer/TextureRect.texture = image
