extends Bot


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	run()
	play_audio("res://audio/call_unavailable.mp3")


func _on_finished() -> void:
	finished()
