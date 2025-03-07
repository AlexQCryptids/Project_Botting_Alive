extends Control


@onready var img = $Image
@onready var cc = $SubtitleBG/Subtitle
@onready var timer = $Timer

@onready var audio_player = $AudioStreamPlayer
@onready var animation_player = $AnimationPlayer

@export var scenes:Array[Texture2D]
@export var lines:Array[String]
@export var next_scene_line:Array[int]
@export var speaker:Array[Color]

@export var audio:AudioStream

var cur_line = 0
var cur_scene = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	audio_player.stream = audio
	audio_player.autoplay = true
	audio_player.play()
	
	timer.one_shot = true
	
	setup()
	set_time()
	
func _input(event: InputEvent) -> void:
	if Input.is_key_pressed(KEY_ESCAPE):
		finished()
		
func setup():
	img.texture = scenes[cur_scene]
	cc.text = lines[cur_line]
	cc.add_theme_color_override("font_outline_color",speaker[cur_line])
	
func set_time():
	var time = lines[cur_line].length() * .07
	timer.wait_time = time
	print("time set to " + str(timer.wait_time))
	timer.start()
	print("timer started")


func _on_timer_timeout() -> void:
	cur_line += 1
	print("line:" + str(cur_line))
	
	if cur_line in next_scene_line:
		print("next scene")
		cur_scene += 1
		
	if cur_line >= lines.size():
		finished()
		return
		
	setup()
	set_time()

func finished():
	animation_player.play("fade_out")
	await animation_player.animation_finished
	get_tree().change_scene_to_file("res://ui_scenes/main_menu.tscn")


func _on_audio_stream_player_finished() -> void:
	audio_player.play()
