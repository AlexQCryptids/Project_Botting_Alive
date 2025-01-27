extends GridContainer

@onready var audio_player = $AudioStreamPlayer
@onready var beep_player = $BeepPlayer # Reference to the AudioStreamPlayer
#@onready var info_label = get_node('../Label')
@onready var dialing_num = $"../CurNum"

var can_proceed = false
var dial_sequence = []
var target_length = 10
var target_sequence = [8, 8, 8, 6, 6, 0, 5, 8, 1, 0]
#var target_sequence = [ 5, 8, 9, 0]
var current_directory_path = "res://audio/voicebot1_main/"  # Start path
var folder_structure = {}
var current_node_array = []

func _ready():
	#Set Number Dialing to nothing
	dialing_num.text = ""
	
	#var font_size = 24  # Desired font size
	
	#for button in self.get_children():
	#	if button is Button:
	#		button.set_custom_minimum_size(Vector2(100, 100))
	
	# Initialize the audio players and add them to the tree
	
	var root_path = "res://audio/voicebot1_main"
	folder_structure = read_directory_structure(root_path) # update golable folder_structure
	print(folder_structure)
		
	# Connect the finished signal of the AudioStreamPlayer
	audio_player.connect("finished", Callable(self, "_on_audio_finished"))

	# Connect button signals
	for button in self.get_children():
		if button.is_in_group("NumBtn"):
			button.connect("pressed", Callable(self, "_on_button_pressed_dial").bind(int(button.text)))

			
func _on_audio_finished():
	can_proceed = true  # Allow button main functions to proceed now that audio has finished


func _on_button_pressed_dial(value):
	
	if value == 9: #Set broken number button
		return
	
	if len(dial_sequence) < target_length:
		play_beep_sound()
		print(value)
	
		#Show What Number You're Calling
		dialing_num.text += str(value)
		dial_sequence.append(value)
		
		#dial_sequence.clear() #.pop_front()  # Keep the sequence within the correct length
		#dialing_num.text = ""
		
	

func play_beep_sound():
	var beep_stream = load('res://audio/button_beep.wav')
	beep_player.stream = beep_stream
	beep_player.play()

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


func play_audio(file_path):
	print("Playing audio:", file_path)
	var audio_stream = load(file_path)
	if audio_stream:
		audio_player.stream = audio_stream
		audio_player.play()
		can_proceed = false

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


func _on_button_call_pressed() -> void:
	# Check if the entered sequence matches the target sequence
	if dial_sequence == target_sequence:
		print("Correct sequence entered.")
		execute_main_logic()


func _on_button_del_pressed() -> void:
	dial_sequence.pop_back()  # Delete llast number entered
	dialing_num.text = ""
	for num in dial_sequence: # Update ui to show changed dialing sequence
		dialing_num.text += str(num) 
