class_name cursor
extends Node2D
@export var crosshair_sprite : Node2D
@export var cursor_sprite : Node2D
var crosshair_mode : bool = false
@onready var cursor = $Crosshair

func _physics_process(_delta: float) -> void:
	self.global_position = get_global_mouse_position()
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	if crosshair_mode == false:
		crosshair_sprite.hide()
		cursor_sprite.show()
	elif crosshair_mode == true:
		crosshair_sprite.show()
		cursor_sprite.hide()

#func _input(event):
	#if event.is_action_pressed("m1"):
		#_killed_enemy()
		#

func _killed_enemy():
	print("You have slayed a zombie!")
	queue_free()

func _on_area_2d_area_entered(_area: Area2D) -> void:
	pass 
