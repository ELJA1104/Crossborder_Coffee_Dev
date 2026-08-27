extends Node2D

@onready var pvz_alt = $pvz_alt
@onready var cus_alt = $cus_alt

var pvz : bool = false
var cus : bool = true

func _ready() -> void:
	pvz_alt.global_position.x = 2000
	cus_alt.global_position.x = 0


func _physics_process(delta: float) -> void:
	tp()

func tp():
	if Input.is_action_just_pressed("Space"):
		if !pvz and cus:
			pvz_alt.global_position.x -= 2000
			cus_alt.global_position.x -= 2000
			pvz = true
			cus = false
		else:
			pvz_alt.global_position.x += 2000
			cus_alt.global_position.x += 2000
			pvz = false
			cus = true
