extends Control

var dial_sequence = []
var target_sequence = [8, 8, 8, 6, 6, 0, 5, 8, 9, 0]
var current_directory_path = "res://audio/"  # Start path

@onready var audio_player = $AudioStreamPlayer



func _ready():
	for i in range(10):  # Assuming buttons are named Button0 to Button9
		var button = $GridContainer.get_node("Button" + str(i))
		button.connect("pressed", self, "_on_button_pressed", [i])

func _on_button_pressed(value):
	dial_sequence.append(value)
	check_dial_sequence()

func check_dial_sequence():
	if dial_sequence.size() > target_sequence.size():
		dial_sequence.pop_front()  # Keep the sequence within the target size

	if dial_sequence == target_sequence:
		play_current_directory_audio()
		print("Dial sequence correct. Entering the folder.")
		# Reset dial_sequence if needed or handle it according to your logic

func play_current_directory_audio():
	var directory = Directory.new()
	if directory.open(current_directory_path) == OK:
		directory.list_dir_begin()
		var filename = directory.get_next()
		while filename != "":
			if filename.ends_with(".mp3"):
				audio_player.stream = load(current_directory_path + filename)
				audio_player.play()
				break
			filename = directory.get_next()
		directory.list_dir_end()
	else:
		print("Failed to open directory: ", current_directory_path)
