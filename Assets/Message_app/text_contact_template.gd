extends Button

@export var scene: String 
@export var cont_name:String

@onready var contact_name = $HBoxContainer/VBoxContainer/ContactName
@onready var last_msg = $HBoxContainer/VBoxContainer/LastMessage
@onready var inital = $HBoxContainer/ContactIcon/Initial

func _ready() -> void:
	contact_name.text = cont_name
	inital.text = cont_name[0]

func _on_pressed() -> void:
	$AudioStreamPlayer.play()
	Global.swap_scene("res://Assets/Message_app/watch_screen_texts.tscn",scene)
	
