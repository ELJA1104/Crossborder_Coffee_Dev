extends Node2D
@export var Cup_spwn_pos : Node2D
var cup
var cup_scene

func _on_spawn_button_pressed() -> void:
	cup_scene = preload("res://Scenes/cup.tscn")
	cup = cup_scene.instantiate()
	add_child(cup)
	cup.global_position = Cup_spwn_pos.global_position
