extends Button

func _ready():
	# Connect the "pressed" signal to a method
	self.pressed.connect(_on_button_pressed)
	
func _on_button_pressed():
		#animation_player.play("fade_out")
	get_tree().change_scene_to_file("res://Assets/Cut_scenes/opening/test_OP.tscn")
