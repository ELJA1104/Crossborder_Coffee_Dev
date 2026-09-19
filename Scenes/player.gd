class_name Player
extends Node2D



func _ready() -> void:
	pass 

func kill():
	get_tree().get_parent().reload_current_scene()
	

func _on_area_2d_area_entered(body):
	if "Enemy" in body.name:
		kill()


func _on_start_button_pressed() -> void:
	pass # Replace with function body.
