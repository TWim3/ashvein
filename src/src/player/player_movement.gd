extends Node


@export var speed: float = 120.0

@export var base: CharacterBody2D
@export var sprite: AnimatedSprite2D


func _physics_process(_delta: float) -> void:
	var input_dir := Input.get_vector("move_left", "move_right", "move_up", "move_down")

	if input_dir != Vector2.ZERO:
		if input_dir.x < 0:
			sprite.flip_h = false
		elif input_dir.x > 0:
			sprite.flip_h = true
			
		sprite.play("walk")
		
		var target_velocity := input_dir * speed
		base.velocity = target_velocity
		base.move_and_slide()
	else:
		sprite.stop()
