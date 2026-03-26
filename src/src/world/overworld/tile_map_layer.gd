extends TileMapLayer

const TERRAIN_SALT   := 0x54455252  # "TERR"
const MOISTURE_SALT  := 0x4D4F4953  # "MOIS"

var _master_seed: int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func generate_master_seed() -> void

func build_grid() -> OverworldGrid:
	var terrain_noise  = NoiseGenerator.new(_master_seed ^ TERRAIN_SALT)
	var ore_noise      = NoiseGenerator.new(_master_seed ^ ORE_SALT)
	var moisture_noise = NoiseGenerator.new(_master_seed ^ MOISTURE_SALT)
