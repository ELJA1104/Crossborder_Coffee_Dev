extends Node2D
@export var customer_spwn_btn : Button
@export var spwn_node : Node2D
var customer_scene
var customer

func _ready() -> void:
	customer_scene = preload("res://Scenes/customers.tscn")
	customer = customer_scene.instantiate()
	
func _on_customer_spawn_button_pressed() -> void:
	spwn_node.add_child(customer)
	#add_child(customer)
	customer.anim_plyr.play("customer_sld_in")
	
