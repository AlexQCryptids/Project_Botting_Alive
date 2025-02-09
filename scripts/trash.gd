extends Node

func execute_main_logic():
	print("Executing main logic...")
	for i in range(get_child_count()):
			var button = get_child(i)
			if button is Button:
				button.disconnect("pressed", Callable(self, "_on_button_pressed_dial"))
				button.connect("pressed", Callable(self, "_on_button_pressed_menu").bind(button.text))
	
	navigate_to(current_node_array)  # Start at the root of the directory
	
func navigate_to(node_array):
	var menu_path = "res://audio/voicebot1_main/" + "/".join(node_array) + '/'
	var current_node = folder_structure
	for key in node_array:
		if key in current_node:
			current_node = current_node[key]  # Move deeper into the dictionary
		else:
			print("Key not found in the current path: ", key)
			return null  # Return null if any key in the path is not found
			
	if typeof(current_node) == TYPE_DICTIONARY:
		# Assume each folder has an audio file as its first element
		for key in current_node:
			print(current_node[key])
			if typeof(current_node[key]) == TYPE_STRING and current_node[key] == "file":
				print(menu_path + key)
				play_audio(menu_path + key)
				break
	
			
func _on_button_pressed_menu(button_text):
	play_beep_sound()
	print("Button pressed for folder:", button_text)
	if can_proceed == true:
		var current_node = folder_structure
		for key in current_node_array:
			if key in current_node:
				current_node = current_node[key]  
			else:
				current_node = null
		
		if current_node:
			for node_keys in current_node.keys():
				if node_keys.begins_with(button_text):
					current_node_array.append(node_keys)
		
					print(current_node_array)
					navigate_to(current_node_array)

# Function to recursively read directory structure and build a nested dictionary
func read_directory_structure(path):
	var structure = {}
	var directory = DirAccess.open(path)
	
	directory.list_dir_begin()
	var filename = directory.get_next()
	while filename != "":
		if filename != "." and filename != ".." and not filename.ends_with(".import"):
			if directory.current_is_dir():
				structure[filename] = read_directory_structure(path + "/" + filename)
			else:
				structure[filename] = "file"  # Or use null or any other placeholder for files
		filename = directory.get_next()
	directory.list_dir_end()
	return structure
	
func play_audio(file_path):
	print("Playing audio:", file_path)
	var audio_stream = load(file_path)
	if audio_stream:
		audio_player.stream = audio_stream
		audio_player.play()
		can_proceed = false
