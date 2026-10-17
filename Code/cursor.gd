class_name cursor
extends Node2D

@onready var cursor = $Crosshair

func _physics_process(delta: float) -> void:
	self.global_position = get_global_mouse_position()
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	
	
#func _input(event):
	#if event.is_action_pressed("m1"):
		#_killed_enemy()
		#

func _killed_enemy():
	print("You have slayed a zombie!")
	queue_free()

func _on_area_2d_mouse_entered() -> void:
	Input.set_default_cursor_shape(Input.CURSOR_ARROW)

func _on_area_2d_2_mouse_exited() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
