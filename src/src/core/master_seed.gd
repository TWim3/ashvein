extends Node

var master_seed = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

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
