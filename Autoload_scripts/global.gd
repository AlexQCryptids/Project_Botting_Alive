extends Node
#Settings Variables
var music_vol = 0
var sfx_vol = 0
var bot_vol = 0
#UI Variables
var time_hr = 23
var time_min = 0
var battery = 5
#Calling Variables
var last_scene = ["res://Assets/Watch_UI/watch_screen_login.tscn"]

'''Change this please like why there are global'''

func change_scene(scene:String):
	var scene_load = load(scene)

	var main_node = get_node("../MainScreen/WatchOverlay/Main/Panel/VBoxContainer/Screen")

	main_node.add_child(scene_load.instantiate())
	main_node.remove_child(main_node.get_child(0))

func swap_scene(last,new):
	last_scene.append(last)
	change_scene(new)
