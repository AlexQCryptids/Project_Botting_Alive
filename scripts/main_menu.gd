extends Control


func _input(event: InputEvent) -> void:
	if event is InputEventKey:
		if Input.is_key_pressed(KEY_ESCAPE):
			get_tree().quit()
	if event is InputEventMouseButton:
		get_tree().change_scene_to_file("res://game_scenes/main_screen.tscn")
