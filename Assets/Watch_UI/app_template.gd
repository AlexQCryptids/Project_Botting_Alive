extends Button

@export var app_name:String
@export var app_icon_img:Texture2D
@export var scene:String

@onready var app_icon = $VBoxContainer/TextureRect
@onready var label = $VBoxContainer/Name

func _ready() -> void:
	app_icon.texture = app_icon_img #Set Icon
	label.text = app_name #Set App Name


func _on_pressed() -> void:
	$AudioStreamPlayer.play()
	Global.swap_scene("res://Assets/Watch_UI/watch_screen_apps.tscn",scene)
