extends Node

var master_seed = 0

enum SeedType {
	ELEVATION = 0x54455252,
	MOISTURE = 0x4D4F4953,
}

func get_seed(seed_type: SeedType) -> int:
	return master_seed ^ seed_type

func new_game(seed_override: int = -1) -> void:
	if seed_override >= 0:
		master_seed = seed_override
	else:
		master_seed = _generate_seed()

func _generate_seed() -> int:
	var rng := RandomNumberGenerator.new()
	rng.randomize()  
	var a := Time.get_unix_time_from_system() as int
	var b := rng.randi()
	# Xorshift mix
	var mixed := a ^ (b << 17) ^ (b >> 13)
	return mixed
