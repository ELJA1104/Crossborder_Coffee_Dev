extends CharacterBody2D
class_name Cinnamon_powder_node

var when_is_grab_cinnamon_powder : bool = false
var is_in_cup_area : bool = false 

func _ready():
	input_pickable = true
	input_event.connect(_on_input_event)
	$"../spwaner(cinnamon powder)/Area2D".body_entered.connect(_on_area_2d_body_entered)

func _process(_delta):
	if when_is_grab_cinnamon_powder:
		global_position = lerp(global_position, get_global_mouse_position(), 0.2)
		if not Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
			_on_release_ingredient()

func _on_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			when_is_grab_cinnamon_powder = true
			get_viewport().set_input_as_handled() 

func _on_release_ingredient():
	when_is_grab_cinnamon_powder = false
	move_to_front() 
	if not is_in_cup_area:
		tp_to_spwaner()

func tp_to_spwaner():
	if $"../spwaner(cinnamon powder)":
		when_is_grab_cinnamon_powder = false
		global_position = $"../spwaner(cinnamon powder)".global_position

func _on_area_2d_body_entered(body):
	if body is Cup_node:
		body.cup_is_in_spwaner()
