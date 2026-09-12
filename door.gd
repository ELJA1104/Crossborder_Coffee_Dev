extends Area2D
var mouse_inside_door : bool = false

func _ready():
	mouse_entered.connect(_on_mouse_entered)
	mouse_exited.connect(_on_mouse_exited)

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed and mouse_inside_door:
			print('start game')
			pass

func _on_mouse_entered():
	mouse_inside_door = true

func _on_mouse_exited():
	mouse_inside_door = false
