class_name Player
extends Node2D



func _ready() -> void:
	pass 

func kill():
	get_tree().change_scene_to_file("res://Scenes/restart.tscn")
	
func _on_area_2d_area_entered(body):
	if "enemy" in body.name:
		kill()
	
func _on_area_2d_2_mouse_exited() -> void:
	pass 
