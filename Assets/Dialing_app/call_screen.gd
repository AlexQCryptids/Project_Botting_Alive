extends VBoxContainer

@onready var beep_player = $GridContainer/BeepPlayer
@onready var cur_num = $CurNum

var number_sequence = Dialing_Global.cur_num_seq
var number_text = Dialing_Global.cur_num

var cur_bot = null

func _ready() -> void:
	# the numer you show is based on sequence
	cur_num.text = ",".join(number_sequence.map(func(x): return str(x))).replace(",", "")
	# Connect button signals
	for button in $GridContainer.get_children():
		if button.is_in_group("NumBtn"):
			button.connect("pressed", Callable(self, "_on_button_pressed_dial").bind((button.name.to_int())))
	load_bot() # connect bots based on the number (text, not seq) 

func load_bot():
	cur_bot = load(Dialing_Global.all_bots[number_text]).instantiate()
	self.add_child(cur_bot)


func _on_button_pressed_dial(value):

	beep_player.play()
	if value == 9: #Set broken number button
		return
	print("target: " + str(cur_bot.target))
	print("cur len: " + str(len(cur_bot.cur_num)))
	if cur_bot.target != [] and len(cur_bot.cur_num) +1 > len(cur_bot.target[0]):
		cur_bot.cur_num = ""
		print("len is greater")

	if cur_bot != null and cur_bot.can_proceed:
		cur_bot.cur_num += str(value)
		print(cur_bot.cur_num)
		cur_bot.input_changed()

	cur_num.text = cur_bot.cur_num

func _on_button_hang_pressed() -> void:
	beep_player.play()
	Dialing_Global.reset_current_call() 
	
	if Dialing_Global.from_contacts == true:
		Global.change_scene("res://Assets/Dialing_app/watch_screen_contacts.tscn")
		Dialing_Global.from_contacts = false
	else:
		Global.change_scene("res://Assets/Dialing_app/watch_screen_dialing.tscn")
