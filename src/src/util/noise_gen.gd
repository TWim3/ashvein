class_name NoiseGenerator extends RefCounted

var _noise: FastNoiseLite

func _init(seed: int) -> void:
	_noise = FastNoiseLite.new()
	_noise.seed = seed


func get_noise_at(coords: Vector2) -> float:
	return _noise.get_noise_2dv(coords)
