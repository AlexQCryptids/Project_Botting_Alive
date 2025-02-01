extends Node

var time_hr = 23
var time_min = 0
var battery = 5

var last_scene = "res://game_scenes/watch_screen_apps.tscn"



func change_scene(scene:String):
	var scene_load = load(scene)
	
	var main_node = get_node("../MainScreen/WatchOverlay/Main/Panel/VBoxContainer/Screen")
	
	#get_tree().get_first_node_in_group("SceneLoader").add_child(scene_load.instance())
	
	main_node.add_child(scene_load.instantiate())
	main_node.remove_child(main_node.get_child(0))
