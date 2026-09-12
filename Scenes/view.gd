extends CharacterBody2D


const SPEED = 300.0

func _physics_process(delta: float) -> void:
	follow_mouse(delta)

func follow_mouse(delta):
	var view = self
	var dir = get_global_mouse_position()
	view.global_position = lerp(view.global_position, dir*delta,1)
