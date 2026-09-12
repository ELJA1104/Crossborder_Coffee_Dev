extends Node2D

@onready var pvz_alt = $pvz_alt
@onready var cus_alt = $cus_alt
@onready var view = $view
@onready var abandon = $abondon1
@onready var abandon2 = $abondon2
@onready var cus = preload("res://Scenes/customer_spawn_area.tscn")
@onready var s = self
@onready var animation = $AnimationPlayer
@onready var area2D = $view/Area2D
@onready var music_player = $Music_player

var toggle : bool = false
var mouse_in : bool = false
var cursor = load("res://Assets/PNG/just_dot.png")


func _ready() -> void:
	pvz_alt.global_position.x = 2000
	cus_alt.global_position.x = 0
	Input.set_custom_mouse_cursor(cursor)
	var ins_cus = cus.instantiate()
	var cus_cam = ins_cus.get_node("Camera2D")
	cus_cam.visible = false
	view.global_position = s.global_position
	music_player.global_position += area2D.global_position

func _physics_process(delta: float) -> void:
	tp(delta)
	space()

func space():
	if Input.is_action_just_pressed("space"):
		if !toggle:
			toggle = true
		else:
			toggle = false

func tp(delta):
	var dir 
	if !toggle:
		dir = cus_alt.global_position
		view.global_position = dir
	else:
		dir = pvz_alt.global_position
		view.global_position = dir
