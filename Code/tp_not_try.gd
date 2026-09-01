extends Node2D

@onready var pvz_alt = $pvz_alt
@onready var cus_alt = $cus_alt
@onready var view = $view
@onready var abandon = $Node2D
@onready var abandon2 = $Node2D2

var toggle : bool = false
var cursor = load("res://Assets/PNG/just_dot.png")


func _ready() -> void:
	pvz_alt.global_position.x = 2000
	cus_alt.global_position.x = 0
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
	if !toggle:
		dir = view.global_position - get_global_mouse_position()
		cus_alt.global_position = lerp(cus_alt.global_position,dir * delta,0.4)
		pvz_alt.global_position = abandon.global_position
	if toggle:
		dir = view.global_position - get_global_mouse_position()
		pvz_alt.global_position = lerp(pvz_alt.global_position,dir * delta, 0.4)
		cus_alt.global_position = abandon2.global_position
