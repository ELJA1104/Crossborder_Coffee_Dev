extends Control

@onready var dot_1 = $dot1
var mouse_entered_1 :bool = false
var mouse_clicked :bool = false

func _ready() -> void:
	mouse_entered.connect(_on_area_2d_mouse_entered)
	

func _physics_process(delta: float) -> void:
	a()
	just_lazy()

func _on_area_2d_mouse_entered() -> void:
	mouse_entered_1 = true
	a()

func a():
	if mouse_entered_1 and mouse_clicked:
		dot_1.global_position.x = get_global_mouse_position().x

func just_lazy():
	if Input.is_action_pressed("m1"):
		mouse_clicked = true
	else:
		mouse_clicked = false

func _on_area_2d_mouse_exited() -> void:
	mouse_entered_1 = false
