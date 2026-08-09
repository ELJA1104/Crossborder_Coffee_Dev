extends CharacterBody2D
var speed = 300.0

var target: Vector2

func _physics_process(delta: float) -> void:
	if position.distance_to(target) > 5.0:
		velocity = position.direction_to(target) * speed
	else:
		velocity = velocity       
	move_and_slide()
