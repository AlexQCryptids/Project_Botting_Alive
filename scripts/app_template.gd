extends AspectRatioContainer

@export var app_name:String
@export var app_icon:Texture2D
@export var scene:String

@onready var icon = $VBoxContainer/Button
@onready var label = $VBoxContainer/Name

func _ready() -> void:
	icon.icon = app_icon #Set Icon
	label.text = app_name #Set App Name

func _on_button_pressed() -> void:
	Global.last_scene = "res://game_scenes/watch_screen_apps.tscn"
	Global.change_scene(scene)
