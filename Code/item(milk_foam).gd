extends CharacterBody2D
class_name Milk_foam_node
var cup
var when_is_grab_milk_foam : bool = false
var mouse_inside_milk_foam : bool = false

func _ready():
	mouse_entered.connect(_on_mouse_entered)
	mouse_exited.connect(_on_mouse_exited)
	$"../spwaner(milk foam)/Area2D".body_entered.connect(_on_area_2d_body_entered)
	$"../spwaner(milk foam)/Area2D".body_exited.connect(_on_area_2d_body_exited)

func _process(_delta):
	if when_is_grab_milk_foam:
		var _mouse_pos = get_global_mouse_position()
		global_position = lerp(global_position,_mouse_pos,0.2)
		return

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed and mouse_inside_milk_foam:
			when_is_grab_milk_foam = true
		else:
			when_is_grab_milk_foam = false

func _on_mouse_entered():
	mouse_inside_milk_foam = true

func _on_mouse_exited():
	mouse_inside_milk_foam = false

func tp_to_spwaner():
	var _spwaner = $"../spwaner(milk foam)" 
	if _spwaner:
		global_position = _spwaner.global_position

func _on_area_2d_body_entered(body):
	print(body.name + 'is in the milk foam spwaner')
	if body is Cup_node:
		cup = body
		cup.is_in_spwaner()

func _on_area_2d_body_exited(body):
	print(body.name + 'is go out to the milk foam spwaner')
	if body is Cup_node:
		cup = body
		cup.is_not_in_spwaner()
