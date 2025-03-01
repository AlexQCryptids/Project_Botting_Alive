extends Button

@export var scene: String 

func _on_pressed() -> void:
	Global.change_scene(scene)
