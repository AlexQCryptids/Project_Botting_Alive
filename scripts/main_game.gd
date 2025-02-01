extends Control


func  _input(event: InputEvent):
	if event is InputEventKey:
		if Input.is_key_pressed(KEY_ESCAPE):
			Global.change_scene(Global.last_scene)
			
