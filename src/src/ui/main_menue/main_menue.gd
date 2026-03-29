extends Control

func _on_new_game_pressed() -> void:
	SceneManager.goto_scene("res://src/prototoype.tscn")

func _on_exit_pressed() -> void:
	get_tree().quit(0)
