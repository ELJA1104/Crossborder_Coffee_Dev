class_name cursor
extends Node2D

@onready var cursor = $Crosshair

func _physics_process(delta: float) -> void:
	self.global_position = get_global_mouse_position()
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)



func _on_area_2d_area_entered(area: Area2D) -> void:
	pass
