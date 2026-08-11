extends Node2D
@export var exit_area : Node2D
#@export var exit_point = exit_area.global_position
var customer_scene
var customer
var ran_drink : int
var flavour
var ran_ice : int
var temp

func _ready() -> void:
	customer_scene = preload("res://Scenes/customers.tscn")
	print(exit_area)
	#print(exit_point)
	drink_select()
	drink_temp()
	print(temp + flavour)

func _process(delta: float) -> void:
	pass

func _on_button_pressed() -> void:	
	customer = customer_scene.instantiate()
	get_tree().root.add_child(customer)
	customer.global_position = self.global_position
	#customer.target = exit_point



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
