extends TileMapLayer

var elevation_map: NoiseGenerator 
var moisture_map: NoiseGenerator 
	
var world_size = Vector2i(100, 100)


func _ready() -> void:
	MasterSeed.new_game() # TODO: Move to general game start / world gen section
	elevation_map = NoiseGenerator.new(MasterSeed.get_seed(MasterSeed.SeedType.ELEVATION))
	moisture_map = NoiseGenerator.new(MasterSeed.get_seed(MasterSeed.SeedType.MOISTURE))
	
	var grid = build_grid()
	fill_tile_map(grid)


func fill_tile_map(grid: OverworldGrid) -> void:
	for tile: OverworldTile in grid.tiles.values():
		set_cell(tile.grid_coord,0, tile.tile_type)

func build_grid() -> OverworldGrid:
	var grid = OverworldGrid.new()
	
	for x in world_size.x:
		for y in world_size.y:
			var pos = Vector2i(x, y)
			var world_pos = grid.tile_to_world(pos)
			
			var tile = OverworldTile.new()
			tile.grid_coord = pos
			tile.world_coord = world_pos
			tile.tile_type = get_overworld_tile_type(pos)
			grid.tiles[pos] = tile
	
	return grid


func get_overworld_tile_type(grid_coord: Vector2i) -> Vector2i:
	var sample_pos = Vector2(grid_coord)
	var elevation = elevation_map.get_noise_at(sample_pos)
	var moisture = moisture_map.get_noise_at(sample_pos)
	return OverworldTileType.get_overworld_tile_type(moisture, elevation)
