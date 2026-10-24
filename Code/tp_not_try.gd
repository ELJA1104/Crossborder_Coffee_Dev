extends Node2D
signal scene(value)
@onready var pvz_alt = $pvz_alt
@onready var cus_alt = $cus_alt
@onready var shop_alt = $Shop_alt
@onready var view = $view
@onready var crosshair = $"Crosshair&Cursor"
var dir
var toggle : int = 0

func _ready() -> void:
	#Input.set_custom_mouse_cursor(cursor)
	pass

func _physics_process(delta: float) -> void:
	tp(delta)
	space()

func space():
	if Input.is_action_just_pressed("space"):
		if toggle == 0:
			toggle = 1
			emit_signal("scene",1)
		elif toggle == 1:
			toggle = 2
			emit_signal("scene",2)
		elif toggle == 2:
			toggle = 0
			emit_signal("scene",0)

func tp(delta):
	if toggle == 0:
		dir = cus_alt.global_position
		view.global_position = lerp(view.global_position, dir, 0.1)
		crosshair.crosshair_mode = false
		
	elif toggle == 1:
		dir = pvz_alt.global_position
		view.global_position = lerp(view.global_position, dir, 0.1)
		crosshair.crosshair_mode = true
		
	elif toggle == 2:
		dir = shop_alt.global_position
		view.global_position = lerp(view.global_position, dir, 0.1)
		crosshair.crosshair_mode = false
		
	var wishvel = get_global_mouse_position()*delta
	view.global_position = lerp(view.global_position, wishvel+dir, 0.4)
