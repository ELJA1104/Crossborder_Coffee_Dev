extends CharacterBody2D
class_name Coffee_bean_node
var cup
var when_is_grab_coffee_bean : bool = false
var mouse_inside_coffee_bean : bool = false

func _ready():
	mouse_entered.connect(_on_mouse_entered)
	mouse_exited.connect(_on_mouse_exited)
	$"../spwaner(coffee bean)/Area2D".body_entered.connect(_on_area_2d_body_entered)
	$"../spwaner(coffee bean)/Area2D".body_exited.connect(_on_area_2d_body_exited)

func _process(_delta):
	if when_is_grab_coffee_bean:
		var _mouse_pos = get_global_mouse_position()
		global_position = lerp(global_position,_mouse_pos,0.2)
		return

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed and mouse_inside_coffee_bean:
			when_is_grab_coffee_bean = true
		else:
			when_is_grab_coffee_bean = false

func _on_mouse_entered():
	mouse_inside_coffee_bean = true

func _on_mouse_exited():
	mouse_inside_coffee_bean = false

func tp_to_spwaner():
	var _spwaner = $"../spwaner(coffee bean)" 
	if _spwaner:
		global_position = _spwaner.global_position

func _on_area_2d_body_entered(body):
	print(body.name + 'is in the coffee bean spwaner')
	if body is Grinder:
		cup = body
		cup.is_in_spwaner()

func _on_area_2d_body_exited(body):
	print(body.name + 'is go out to the coffee bean spwaner')
	if body is Grinder:
		cup = body
		cup.is_not_in_spwaner()
