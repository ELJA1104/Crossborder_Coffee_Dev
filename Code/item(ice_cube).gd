extends CharacterBody2D
class_name Ice_cube_node
var when_is_grab_ice_cube : bool = false
var is_in_cup_area : bool = false 

func _ready():
	input_pickable = true
	input_event.connect(_on_input_event)
	$"../spwaner(ice cube)/Area2D".body_entered.connect(_on_area_2d_body_entered)


func _process(_delta):
	if when_is_grab_ice_cube:
		global_position = lerp(global_position, get_global_mouse_position(), 0.2)
		if not Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
			_on_release_ingredient()

func _on_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			when_is_grab_ice_cube = true
			get_viewport().set_input_as_handled() 

func _on_release_ingredient():
	when_is_grab_ice_cube = false
	move_to_front() 
	tp_to_spwaner()

func tp_to_spwaner():
	if $"../spwaner(ice cube)":
		when_is_grab_ice_cube = false
		global_position = $"../spwaner(ice cube)".global_position

func _on_area_2d_body_entered(body):
	if body is Cup_node:
		body.cup_is_in_spwaner()
