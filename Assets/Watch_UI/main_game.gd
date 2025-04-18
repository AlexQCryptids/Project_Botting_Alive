extends Control

func button_back():
	print(Global.scene_seq)
	#print(Global.current_scene)
	
	if Global.current_scene != Global.scene_seq[-1]:
		Global.change_scene(Global.scene_seq[-1])
		Global.scene_seq.pop_back()
		
	if Global.current_scene == Global.scene_seq[-1]: 
		# it could be possible that you hit multiple repetitive scenes
		for i in range(len(Global.scene_seq)):
			var index_tail = len(Global.scene_seq)-1-i
			#print(Global.current_scene)
			#print(Global.scene_seq[index_tail])
			if Global.current_scene != Global.scene_seq[index_tail]:
				Global.change_scene(Global.scene_seq[index_tail])
				Global.scene_seq = Global.scene_seq.slice(0, index_tail+1)
				break
				

func  _input(event: InputEvent):
	if event is InputEventKey:
		if Input.is_key_pressed(KEY_ESCAPE) and len(Global.scene_seq) > 1:
			button_back()

	if event is InputEventMouseMotion:
		$PointLight2D.position = get_local_mouse_position()


func _on_back_button_pressed() -> void:
	$SFX.play()
	if len(Global.scene_seq) > 1:
		button_back()
