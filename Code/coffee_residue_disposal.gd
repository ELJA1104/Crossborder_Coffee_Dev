extends Node2D
var puck

func _on_extract_area_body_entered(body: Node2D) -> void:
	print(body)
	if body is Ethan_Puck:
		puck = body
		print(puck)
	

func _on_extract_area_body_exited(body: Node2D) -> void:
	puck = null

func _on_button_pressed() -> void:
	puck.is_empty = true
	puck.used_once = false
