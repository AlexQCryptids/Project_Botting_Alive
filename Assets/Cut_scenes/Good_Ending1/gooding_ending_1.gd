extends Node2D

func _ready() -> void:
	print('playing')
	$AnimationPlayer.play()
	await $AnimationPlayer.animation_finished
	print('done!')
	finished()

func finished():
	#$AnimationPlayer.play("fade_out")
	#await $AnimationPlayer.animation_finished
	get_tree().change_scene_to_file("res://Assets/Main_menu/main_menu.tscn")

func _input(event: InputEvent) -> void:
	if Input.is_key_pressed(KEY_ESCAPE):
		finished()
