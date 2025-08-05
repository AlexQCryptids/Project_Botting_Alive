extends Bot

func _ready() -> void:
	print("BankBot Loaded")
	run()
	
	
func run():
	greeting()
	
func greeting():
	reset()
	play_audio("res://Audio/BankBot/dial.mp3")
	
	target = ["1","2"]
	await  input_recieved
	
	if cur_num == "1":
		if playing:
			stop()  # Stop audio immediately
		survey()
	elif cur_num == "2":
		if playing:
			stop()  # Stop audio immediately
		menu.call()
		
func survey():
	reset()
	play_audio("res://Audio/BankBot/survey.mp3")
	
	target = ["1","2"]
	await input_recieved
	if cur_num in target:
		if playing:
			stop()  # Stop audio immediately
		survey2()
		
func survey2():
	reset()
	play_audio("res://Audio/BankBot/survey2.mp3")
	
	target = ["1","2"]
	await input_recieved
	if cur_num in target:
		if playing:
			stop()  # Stop audio immediately
		survey3()

func survey3():
	reset()
	play_audio("res://Audio/BankBot/survey3.mp3")
	
	target = ["1","2"]
	await input_recieved
	if cur_num in target:
		if playing:
			stop()  # Stop audio immediately
		survey4()
		
func survey4():
	reset()
	play_audio("res://Audio/BankBot/survey4.mp3")
	
	target = ["1","2"]
	await input_recieved
	if cur_num == "1":
		if playing:
			stop()  # Stop audio immediately
		menu.call()
	elif cur_num == "2":
		if playing:
			stop()  # Stop audio immediately
		advisor()
		
func advisor():
	reset()
	play_audio("res://Audio/BankBot/advisor.mp3")
	
	target = ["42076613"]
	await input_recieved
	
	if cur_num in target:
	
		play_audio("res://Audio/BankBot/wait.mp3")
		await finished
	
		play_audio("res://Audio/BankBot/wait_song_rick_roll.mp3")
		
var menu = func main_menu():
	reset()
	play_audio("res://Audio/BankBot/main_menu.mp3")
	
	target = ["1","2","3"]
	await input_recieved
	
	if cur_num == "1":
		if playing:
			stop()  # Stop audio immediately
		acct_info_1()
	elif cur_num == "2":
		if playing:
			stop()  # Stop audio immediately
		payment_2()
	elif cur_num == "3":
		if playing:
			stop()  # Stop audio immediately
		fin_mgmt_3()
	
func acct_info_1():
	reset()
	play_audio("res://Audio/BankBot/accout_info.mp3")
	
	target = ["0","1","2"]
	await input_recieved
	
	if cur_num == "0":
		if playing:
			stop()  # Stop audio immediately
		menu.call()
	elif cur_num == "1":
		if playing:
			stop()  # Stop audio immediately
		acct_num_1()
	elif cur_num =="2":
		if playing:
			stop()  # Stop audio immediately
		forgot_2()
		
func acct_num_1():
	reset()
	play_audio("res://Audio/BankBot/account_lock.mp3")
	
	
func forgot_2():
	reset()
	play_audio("res://Audio/BankBot/forget.mp3")
	
	target = ["500327281"]
	await input_recieved
	
	if cur_num in target:
		acct.call()
		
var acct = func real_acct():
	reset()
	play_audio("res://Audio/BankBot/real_account.mp3")
	target = ["0","1","2","3"]
	await input_recieved
	
	if cur_num == "0":
		if playing:
			stop()  # Stop audio immediately
		menu.call()
	elif cur_num == "1":
		if playing:
			stop()  # Stop audio immediately
		balance_1()
	elif cur_num == "2":
		if playing:
			stop()  # Stop audio immediately
		transactions_2()
	elif cur_num == "3":
		if playing:
			stop()  # Stop audio immediately
		card_3()
	
func balance_1():
	reset()
	play_audio("res://Audio/BankBot/balance.mp3")
	
	target = ["0"]
	await input_recieved
	
	if cur_num in target:
		if playing:
			stop()  # Stop audio immediately
		acct.call()
	
func transactions_2():
	reset()
	play_audio("res://Audio/BankBot/transaction.mp3")
	target = ["1","2","3"]
	await input_recieved
	
	if cur_num in target:
		play_audio("res://Audio/BankBot/transaction_text.mp3")
		if playing:
			stop()  # Stop audio immediately
		
		target = ["0"]
		await input_recieved
		if cur_num in target:
			acct.call()
	
func card_3():
	reset()
	play_audio("res://Audio/BankBot/card.mp3")
	
	target = ["0"]
	await input_recieved
	
	if cur_num in target:
		if playing:
			stop()  # Stop audio immediately
		acct.call()
		
func payment_2():
	reset()
	play_audio("res://Audio/BankBot/payment.mp3")
	
	target = ["0"]
	await input_recieved
	
	if cur_num in target:
		if playing:
			stop()  # Stop audio immediately
		menu.call()
	
func fin_mgmt_3():
	reset()
	play_audio("res://Audio/BankBot/financial_management.mp3")
	
	target = ["1","2"]
	await input_recieved
	
	if cur_num == "1":
		if playing:
			stop()  # Stop audio immediately
		survey()
	elif cur_num == "2":
		if playing:
			stop()  # Stop audio immediately
		menu.call()
