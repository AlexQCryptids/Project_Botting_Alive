extends Control


func  _input(event: InputEvent):
	if event is InputEventKey:
		if Input.is_key_pressed(KEY_ESCAPE) and len(Global.last_scene) > 1:
			print(Global.last_scene)
			Global.change_scene(Global.last_scene.back())
			Global.last_scene.pop_back()
			print(Global.last_scene)
	if event is InputEventMouseMotion:
		$PointLight2D.position = get_local_mouse_position()

	
