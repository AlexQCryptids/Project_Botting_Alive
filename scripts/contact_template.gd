extends Button

@export var cont_name:String
@export var cont_num:Array[int]
@export var cont_icon:Texture2D

@onready var contact_name = $Panel/HBoxContainer/VBoxContainer/ContactName
@onready var contact_number = $Panel/HBoxContainer/VBoxContainer/ContactNumber
@onready var contact_icon = $Panel/HBoxContainer/ContactIcon

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	
	contact_name.text = cont_name #Set Contact Name
	
	#Set Contact Number
	var number = ""
	for i in cont_num:
		number+= str(i)
	contact_number.text = number
	
	if cont_icon != null:
		contact_icon.texture = cont_icon



func _on_pressed() -> void:
	$AudioStreamPlayer.play()
	Global.set_current_call(contact_number.text,cont_num)
	Global.swap_scene("res://game_scenes/watch_screen_contacts.tscn","res://game_scenes/watch_screen_calling.tscn")
