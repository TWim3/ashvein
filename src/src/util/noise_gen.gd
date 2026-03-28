class_name NoiseGenerator extends RefCounted

var _noise: FastNoiseLite

func _init(init_seed: int) -> void:
	_noise = FastNoiseLite.new()
	_noise.seed = init_seed


func get_noise_at(coords: Vector2) -> float:
	return (_noise.get_noise_2dv(coords) + 1.0) * 0.5
