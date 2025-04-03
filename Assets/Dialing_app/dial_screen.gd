extends VBoxContainer

func _input(event: InputEvent) -> void:
	if event is InputEventKey:
		if Input.is_key_pressed(KEY_TAB):
			Global.swap_scene("res://game_scenes/watch_screen_dialing.tscn","res://game_scenes/watch_screen_contacts.tscn")


func _on_contacts_button_pressed() -> void:
	Global.swap_scene("res://game_scenes/watch_screen_dialing.tscn","res://game_scenes/watch_screen_contacts.tscn")
