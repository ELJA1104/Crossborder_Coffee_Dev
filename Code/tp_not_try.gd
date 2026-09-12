extends Node2D

@onready var pvz_alt = $pvz_alt
@onready var cus_alt = $cus_alt
@onready var view = $view

var toggle : bool = false
var cursor = load("res://Assets/PNG/just_dot.png")

func _ready() -> void:
	Input.set_custom_mouse_cursor(cursor)

func _physics_process(delta: float) -> void:
	tp(delta)
	space()

func space():
	if Input.is_action_just_pressed("space"):
		if !toggle:
			toggle = true
		elif toggle:
			toggle = false
		if toggle:
			print("yes")
		if !toggle:
			print("false")

func tp(delta):
	var dir
	if toggle:
		dir = cus_alt.global_position
		view.global_position = lerp(view.global_position, dir, 0.5)
	if !toggle:
		dir = pvz_alt.global_position
		view.global_position = lerp(view.global_position, dir, 0.5)
