extends Button

@export var scene: String 

func _ready() -> void:
	$AudioStreamPlayer.stream = load("res://audio/clickSound.wav")

func _on_pressed() -> void:
	$AudioStreamPlayer.play()
	Global.change_scene(scene)
	
