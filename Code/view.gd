extends CharacterBody2D

@export var speed = 100
@onready var view = self
var cursor = load("res://Assets/PNG/just_dot.png")
var cus = preload("res://Scenes/customer_spawn_area.tscn")

func _ready() -> void:
	Input.set_custom_mouse_cursor(cursor)


func _physics_process(delta: float) -> void:
	movement_lerp(delta)

func movement_lerp(delta):
	var dir = get_global_mouse_position()
	var wishvel = dir * delta
	view.global_position = lerp(view.global_position,wishvel,1)
