extends Node

var all_bots = {"0":"res://Assets/Bots/unavailable_bot.tscn",
				"4047432740":"res://Assets/Bots/bank_bot.tscn",
				"0703581654":"res://Assets/Bots/restaurant_bot.tscn"}
# acutually if not in the dict, then it should be non-avaible

var cur_num = ""
var cur_num_seq = []
var cur_calling_transition_name = ""
var from_contacts = false

func set_current_call(num_str:String,num_seq:Array):
	cur_num = num_str
	cur_num_seq = num_seq

func reset_current_call():
	set_current_call("",[])

func set_no_caller(seq):
	set_current_call("0",seq)

func set_current_call_transition_name(name):
	cur_calling_transition_name = name
