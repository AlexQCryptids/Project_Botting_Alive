extends Bot

func _ready() -> void:
	print("Georgia Power Bot Loaded")
	run()
	
func _on_finished() -> void:
	can_proceed = true 
	
func run():
	greeting()
	
func greeting():
	reset()
	play_audio("res://audio/voicebot1_main/GP_opening.mp3")
	target = ["1","2"]
	await input_recieved
	
	if cur_num == "1":
		yes_1()
	elif cur_num == "2":
		no_2()
		
func yes_1():
	reset()
	play_audio("res://audio/voicebot1_main/1feedbackyes/dieyoung.mp3")
	
func no_2():
	reset()
	play_audio("res://audio/voicebot1_main/2feedbackno/GP_mainmenu.mp3")
	target = ["1","2","3"]
	await input_recieved
	
	if cur_num == "1":
		rent_1()
	elif cur_num == "2":
		balance_2()
	elif cur_num == "3":
		outage_3()
		
func rent_1():
	reset()
	play_audio("res://audio/voicebot1_main/2feedbackno/1rent/pay_rent.mp3")
	
func balance_2():
	reset()
	play_audio("res://audio/voicebot1_main/2feedbackno/2balance/check_balance.mp3")
	
func outage_3():
	reset()
	play_audio("res://audio/voicebot1_main/2feedbackno/3outage/outage.mp3")
	target = ["1","2","3"]
	await  input_recieved
	
	if cur_num == "1":
		snow_1()
	elif cur_num == "2":
		hurricane_2()
	elif cur_num == "3":
		fire_3()
		
func snow_1():
	reset()
	play_audio("res://audio/voicebot1_main/2feedbackno/3outage/1snow/snow.mp3")
	target = ["3"]
	
	await input_recieved
	if cur_num == "3":
		play_audio("res://audio/voicebot1_main/2feedbackno/3outage/1snow/3rep/rep.mp3")
	
func hurricane_2():
	reset()
	play_audio("res://audio/voicebot1_main/2feedbackno/3outage/2hurricane/shittalk.mp3")
	
func fire_3():
	reset()
	play_audio("res://audio/voicebot1_main/2feedbackno/3outage/3fire/alive.mp3")
	
	
	
