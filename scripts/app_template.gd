extends AspectRatioContainer

@export var app_name:String
@export var app_icon:Texture2D
#@export var scene:n

@onready var icon = $VBoxContainer/Button
@onready var label = $VBoxContainer/Name


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	icon.icon = app_icon
	label.text = app_name


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://game_scenes/dial_screen.tscn")
