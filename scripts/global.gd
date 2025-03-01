extends Node

var time_hr = 23
var time_min = 0
var battery = 5

var last_scene = ["res://game_scenes/watch_screen_dialing.tscn"]

var cur_num = ""
var cur_num_seq = []

var all_bots = {"4047432740":"res://bots/bank_bot.tscn",
				"8886605810":"res://bots/georgia_power_bot.tscn"}


func change_scene(scene:String):
	var scene_load = load(scene)
	
	var main_node = get_node("../MainScreen/WatchOverlay/Main/Panel/VBoxContainer/Screen")
	
	main_node.add_child(scene_load.instantiate())
	main_node.remove_child(main_node.get_child(0))
	
func swap_scene(last,new):
	last_scene.append(last)
	change_scene(new)

func set_current_call(num_str:String,num_seq:Array):
	cur_num = num_str
	cur_num_seq = num_seq


	
