extends CharacterBody2D

@export var speed = 100
@onready var left : Button = $lft/lft_but
@onready var right :Button = $rght/rght_but
@onready var limit : Camera2D = $"player's_view"
@onready var view = self
var cursor = load("res://Assets/PNG/just_dot.png")
var cus = preload("res://Scenes/customer_spawn_area.tscn")

func _ready() -> void:
	Input.set_custom_mouse_cursor(cursor)
	left.hide()
	right.hide()

func _physics_process(delta: float) -> void:
	movement_lerp(delta)

func movement_lerp(delta):
	var dir = get_global_mouse_position()
	var wishvel = dir * delta
	view.global_position = lerp(view.global_position,wishvel,1)

func _on_lft_mouse_entered() -> void:
	left.show()

func _on_lft_mouse_exited() -> void:
	left.hide()

func _on_rght_mouse_entered() -> void:
	right.show()

func _on_rght_mouse_exited() -> void:
	right.hide()

func tp():
	var cus_2 = cus.instantiate()
	if left.pressed:
		view.position = cus_2
