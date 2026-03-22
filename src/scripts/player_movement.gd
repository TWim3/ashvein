extends Node

## DwarfMovement — composable movement component.
## Add as child node to any CharacterBody2D. 

@export_group("Movement")
@export var speed: float = 120.0
@export var acceleration: float = 800.0
@export var friction: float = 600.0

@export var base: CharacterBody2D


func _physics_process(delta: float) -> void:
	var input_dir := Input.get_vector("move_left", "move_right", "move_up", "move_down")
	var target_velocity := input_dir * speed

	if input_dir != Vector2.ZERO:
		base.velocity = base.velocity.move_toward(target_velocity, acceleration * delta)
	else:
		base.velocity = base.velocity.move_toward(Vector2.ZERO, friction * delta)

	base.move_and_slide()
