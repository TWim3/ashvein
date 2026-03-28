class_name OverworldGrid extends Resource

var _tile_size: int = 16 #px

var tiles: Dictionary[Vector2i, OverworldTile]

func world_to_tile(world_pos: Vector2) -> Vector2i:
	return Vector2i(
		floori(world_pos.x / _tile_size),
		floori(world_pos.y / _tile_size)
	)

func tile_to_world(tile_pos: Vector2i) -> Vector2:
	return Vector2(tile_pos.x * _tile_size, tile_pos.y * _tile_size)
