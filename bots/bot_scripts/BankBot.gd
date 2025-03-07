extends Bot

func _ready() -> void:
	print("BankBot Loaded")
	run()
	
	
func run():
	greeting()
	
func greeting():
	reset()
	play_audio("res://audio/BankBot/dial.mp3")
	
	target = ["1","2"]
	await  input_recieved
	
	if cur_num == "1":
		survey()
	elif cur_num == "2":
		menu.call()
		
func survey():
	reset()
	play_audio("res://audio/BankBot/survey.mp3")
	
	target = ["1","2"]
	await input_recieved
	if cur_num in target:
		survey2()
		
func survey2():
	reset()
	play_audio("res://audio/BankBot/survey.mp3")
	
	target = ["1","2"]
	await input_recieved
	if cur_num in target:
		survey3()

func survey3():
	reset()
	play_audio("res://audio/BankBot/survey.mp3")
	
	target = ["1","2"]
	await input_recieved
	if cur_num in target:
		survey4()
		
func survey4():
	reset()
	play_audio("res://audio/BankBot/survey.mp3")
	
	target = ["1","2"]
	await input_recieved
	if cur_num == "1":
		menu.call()
	elif cur_num == "2":
		advisor()
		
func advisor():
	reset()
	play_audio("res://audio/BankBot/advisor.mp3")
	
	target = ["4207661358821467"]
	await input_recieved
	
	if cur_num in target:
	
		play_audio("res://audio/BankBot/wait.mp3")
		await finished
	
		play_audio("res://audio/BankBot/wait_song_rick_roll.mp3")
		
var menu = func main_menu():
	reset()
	play_audio("res://audio/BankBot/main_menu.mp3")
	
	target = ["1","2","3"]
	await input_recieved
	
	if cur_num == "1":
		acct_info_1()
	elif cur_num == "2":
		payment_2()
	elif cur_num == "3":
		fin_mgmt_3()
	
func acct_info_1():
	reset()
	play_audio("res://audio/BankBot/accout_info.mp3")
	
	target = ["0","1","2"]
	await input_recieved
	
	if cur_num == "0":
		menu.call()
	elif cur_num == "1":
		acct_num_1()
	elif cur_num =="2":
		forgot_2()
		
func acct_num_1():
	reset()
	play_audio("res://audio/BankBot/account_lock.mp3")
	
	
func forgot_2():
	reset()
	play_audio("res://audio/BankBot/forget.mp3")
	
	target = ["500327281"]
	await input_recieved
	
	if cur_num in target:
		acct.call()
		
var acct = func real_acct():
	reset()
	play_audio("res://audio/BankBot/real_account.mp3")
	target = ["0","1","2","3"]
	await input_recieved
	
	if cur_num == "0":
		menu.call()
	elif cur_num == "1":
		balance_1()
	elif cur_num == "2":
		transactions_2()
	elif cur_num == "3":
		card_3()
	
func balance_1():
	reset()
	play_audio("res://audio/BankBot/balance.mp3")
	
	target = ["0"]
	await input_recieved
	
	if cur_num in target:
		acct.call()
	
func transactions_2():
	reset()
	play_audio("res://audio/BankBot/transaction.mp3")
	target = ["1","2","3"]
	await input_recieved
	
	if cur_num in target:
		play_audio("res://audio/BankBot/transaction_text.mp3")
		
		target = ["0"]
		await input_recieved
		if cur_num in target:
			acct.call()
	
func card_3():
	reset()
	play_audio("res://audio/BankBot/card.mp3")
	
	target = ["0"]
	await input_recieved
	
	if cur_num in target:
		acct.call()
		
func payment_2():
	reset()
	play_audio("res://audio/BankBot/payment.mp3")
	
	target = ["0"]
	await input_recieved
	
	if cur_num in target:
		menu.call()
	
func fin_mgmt_3():
	reset()
	play_audio("res://audio/BankBot/financial_management.mp3")
	
	target = ["1","2"]
	await input_recieved
	
	if cur_num == "1":
		survey()
	elif cur_num == "2":
		menu.call()
