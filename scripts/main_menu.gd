extends Control



func _on_play_btn_pressed() -> void:
	get_tree().change_scene_to_file("res://game_scenes/main_screen.tscn")
