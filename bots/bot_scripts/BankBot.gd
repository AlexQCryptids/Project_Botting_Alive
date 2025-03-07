extends Bot

func _ready() -> void:
	print("BankBot Loaded")
	run()
	
func _on_finished() -> void:
	can_proceed = true 
	
func run():
	greeting()
	
func greeting():
	reset()
	play_audio("res://audio/BankBot/greeting.mp3")
	target = ["1","2","3"]
	
	await input_recieved
	if cur_num == "1":
		transaction_1()
	elif cur_num == "2":
		loan_2()
	elif  cur_num == "3":
		card_3()
	 
	
func transaction_1():
	reset()
	play_audio("res://audio/BankBot/1transaction/1transaction.mp3")
	target = ["1"]
	await input_recieved
	
	if cur_num == "1":
		play_audio("res://audio/BankBot/1transaction/1review statement/1review.mp3")
	
func loan_2():
	reset()
	play_audio("res://audio/BankBot/2loan/2loan.mp3")
	
func card_3():
	reset()
	play_audio("res://audio/BankBot/3card/3card.mp3")
