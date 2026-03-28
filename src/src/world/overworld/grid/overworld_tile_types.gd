class_name OverworldTileType extends RefCounted

const OverworldTileTypes := {
	grass = Vector2i(0,0),
	forest = Vector2i(1,0),
	mountain = Vector2i(2,0),
	desert = Vector2i(0,1),
	water = Vector2i(1,1)
}


static func get_overworld_tile_type(moisture: float, elevation: float) -> Vector2i:
	if elevation > 0.7:
		return OverworldTileTypes.mountain
	elif elevation < 0.3:
		return OverworldTileTypes.water
	elif moisture < 0.4:
		return OverworldTileTypes.desert
	elif moisture > 0.4 and elevation > 0.5:
		return OverworldTileTypes.forest
	else:
		return OverworldTileTypes.grass
