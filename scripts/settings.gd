extends Control

var min_val = -80
var max_val = 6
var default = 0

@onready var sfx = $HBoxContainer/VBoxContainer2/SFX
@onready var music = $HBoxContainer/VBoxContainer2/Music
@onready var bot = $HBoxContainer/VBoxContainer2/Bot

var sfx_bus = AudioServer.get_bus_index("SFX")
var music_bus = AudioServer.get_bus_index("Master")
var bot_bus = AudioServer.get_bus_index("Bot")

func _ready() -> void:
	#set min and max values
	sfx.min_value = min_val
	sfx.max_value = max_val
	music.min_value = min_val
	music.max_value = max_val
	bot.min_value = min_val
	bot.max_value = max_val
	#set default values
	sfx.value = Global.sfx_vol
	music.value = Global.music_vol
	bot.value = Global.bot_vol
	
func _on_music_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(music_bus,value)
	Global.music_vol = value


func _on_sfx_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(sfx_bus,value)
	Global.sfx_vol = value


func _on_bot_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(bot_bus,value)
	Global.bot_vol = value
