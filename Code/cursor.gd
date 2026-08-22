extends Node2D

func _physics_process(delta: float) -> void:
	self.global_position = get_global_mouse_position()
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
