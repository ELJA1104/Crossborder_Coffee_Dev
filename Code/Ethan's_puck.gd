extends CharacterBody2D
class_name Ethan_Puck
@export var Text_label : Label
var dragged : bool = false
var is_empty : bool = true
var used_once : bool = false
var is_filling : bool = false
var Offset : Vector2 = Vector2(0,0)
var flavour : String

func _on_button_button_down() -> void:
	if is_filling == false:
		dragged = true
		Offset = get_global_mouse_position() - self.global_position
	if is_filling == true:
		dragged = false
func _on_button_button_up() -> void:
	dragged = false
	
func _process(delta: float) -> void:
	if dragged == true:
		self.global_position = lerp(global_position, get_global_mouse_position(), 0.5) - Offset
	if is_empty == true:
		if used_once == false:
			Text_label.text = "The puck needs coffee grounds"
	elif is_empty == false:
		Text_label.text = "Puck is Filled"
		if used_once == true:
			Text_label.text = "This puck has been used"
