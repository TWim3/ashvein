extends Node

signal scene_changed(scene_name: String)

var _current_scene: Node = null

func _ready() -> void:
	var root = get_tree().root
	_current_scene = root.get_child(root.get_child_count() - 1)

func goto_scene(path: String) -> void:
	call_deferred("_deferred_goto_scene", path)

func _deferred_goto_scene(path: String) -> void:
	_current_scene.free()
	var scene: PackedScene = load(path)
	_current_scene = scene.instantiate()
	get_tree().root.add_child(_current_scene)
	get_tree().current_scene = _current_scene
	scene_changed.emit(_current_scene.name)
