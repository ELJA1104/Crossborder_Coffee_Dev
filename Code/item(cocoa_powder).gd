extends CharacterBody2D
class_name Cocoa_powder_node
var cup
var when_is_grab_cocoa_powder : bool = false
var mouse_inside_cocoa_powder : bool = false

func _ready():
	mouse_entered.connect(_on_mouse_entered)
	mouse_exited.connect(_on_mouse_exited)
	$"../spwaner(cocoa powder)/Area2D".body_entered.connect(_on_area_2d_body_entered)
	$"../spwaner(cocoa powder)/Area2D".body_exited.connect(_on_area_2d_body_exited)

func _process(_delta):
	if when_is_grab_cocoa_powder:
		var _mouse_pos = get_global_mouse_position()
		global_position = lerp(global_position,_mouse_pos,0.2)
		return

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed and mouse_inside_cocoa_powder:
			when_is_grab_cocoa_powder = true
		else:
			when_is_grab_cocoa_powder = false

func _on_mouse_entered():
	mouse_inside_cocoa_powder = true

func _on_mouse_exited():
	mouse_inside_cocoa_powder = false

func tp_to_spwaner():
	var _spwaner = $"../spwaner(cocoa powder)" 
	if _spwaner:
		global_position = _spwaner.global_position

func _on_area_2d_body_entered(body):
	print(body.name + 'is in the cocoa powder spwaner')
	if body is Cup_node:
		cup = body
		cup.is_in_spwaner()

func _on_area_2d_body_exited(body):
	print(body.name + 'is go out to the cocoa powder spwaner')
	if body is Cup_node:
		cup = body
		cup.is_not_in_spwaner()
