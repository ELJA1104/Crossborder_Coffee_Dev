extends CharacterBody2D
class_name  Cust0mers
var speed = 300.0
var has_ordered : bool = false
var has_recieved_order : bool = false
var ran_drink : int
var flavour
var ran_ice : int
var temp
var target: Vector2

func _physics_process(delta: float) -> void:
	move_and_slide()
	if position.distance_to(target) > 10.0:
		velocity = position.direction_to(target) * speed
	else:
		velocity = velocity
		
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
