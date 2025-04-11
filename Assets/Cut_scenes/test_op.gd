extends Node2D

@export var camera : Camera2D

var shake_strength: float = 0.0
var DECAY_RATE: float = 5.0


# following are for the camera shaking
func apply_shake():
	shake_strength = 10
	
func _process(delta: float):
	shake_strength = lerp(shake_strength, 0.0, DECAY_RATE * delta)
	camera.offset = get_random_offset()
	
func get_random_offset() -> Vector2:
	return Vector2(
		randf_range(-shake_strength, shake_strength),
		randf_range(-shake_strength, shake_strength)
	)
