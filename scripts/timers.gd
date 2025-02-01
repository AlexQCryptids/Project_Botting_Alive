extends Node

@onready var min_timer = $MinTimer
@onready var ui = $"../WatchOverlay/Main/Panel/VBoxContainer/UIBG/UI"

var min_time_scale = 3


func _ready() -> void:
	min_timer.wait_time = min_time_scale

func _on_min_timer_timeout() -> void:
	Global.time_min += 1
	if (Global.time_min == 60):
		Global.time_min = 0
		Global.time_hr += 1
		
	#min_timer.start() #Restart timer
	ui.set_time() #Change UI to reflect time
	
