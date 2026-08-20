extends CharacterBody2D
class_name Milk_node

var when_is_grab_milk : bool = false
var is_in_cup_area : bool = false 

func _ready():
	input_pickable = true
	input_event.connect(_on_input_event)
	$"../spwaner(milk)/Area2D".body_entered.connect(_on_area_2d_body_entered)
	$"../spwaner(milk)/Area2D".body_exited.connect(_on_area_2d_body_exited)

func _process(_delta):
	if when_is_grab_milk:
		global_position = lerp(global_position, get_global_mouse_position(), 0.2)
		if not Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
			_on_release_ingredient()

func _on_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			when_is_grab_milk = true
			get_viewport().set_input_as_handled() 

func _on_release_ingredient():
	when_is_grab_milk = false
	move_to_front() 
	if not is_in_cup_area:
		tp_to_spwaner()

func tp_to_spwaner():
	if $"../spwaner(milk)":
		when_is_grab_milk = false
		global_position = $"../spwaner(milk)".global_position

func _on_area_2d_body_entered(body):
	if body is Cup_node:
		is_in_cup_area = true 

func _on_area_2d_body_exited(body):
	if body is Cup_node:
		is_in_cup_area = false
