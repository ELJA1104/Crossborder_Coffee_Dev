extends CharacterBody2D
class_name  Cust0mers
var speed = 300.0
var has_ordered : bool = false
var has_recieved_order : bool = false
var ran_drink : int
var flavour
var ran_ice : int
var temp
var strt_conver : bool = false
var mouse_inside : bool = false
@onready var target_point : Vector2

func _physics_process(delta: float) -> void:
	move_and_slide()
	if target_point != null:
		velocity = position.direction_to(target_point) * speed
		move_and_slide()
	if target_point == null:
		pass

func drink_select():
	ran_drink = randi_range(0, 6)
	if ran_drink == 0:
		flavour = "Water"
	elif ran_drink == 1:
		flavour = "Americano"
	elif ran_drink == 2:
		flavour = "Cappuccino"
	elif ran_drink == 3:
		flavour = "Espresso"
	elif ran_drink == 4:
		flavour = "Macchiato"
	elif ran_drink == 5:
		flavour = "Mocha"
	elif ran_drink == 6:
		flavour = "Latte"

func drink_temp():
	ran_ice = randi_range(0, 2)
	if ran_ice == 0:
		temp = "Hot "
	elif ran_ice == 1:
		temp = "Warm "
	elif ran_ice == 2:
		temp = "Cold "

	if temp == "Cold " and flavour == "Water":
		temp = "Cold  "
	if temp == "Hot " and flavour == "Water":
		temp = "Hot  "

func _ready() -> void:
	drink_select()
	drink_temp()

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed and mouse_inside == true:
			strt_conver = true
			print(strt_conver)
		else:
			strt_conver = false
			print("g")

func _on_area_2d_mouse_entered() -> void:
	mouse_inside = true
func _on_area_2d_mouse_exited() -> void:
	mouse_inside = false
