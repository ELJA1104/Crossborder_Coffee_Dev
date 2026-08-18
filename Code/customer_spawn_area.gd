extends Node2D
@export var customer_spwn_btn : Button
@export var has_fnshd_drnk_btn : Button
@export var ok_btn : Button
var customer_scene
var customer

func _ready() -> void:
	customer_scene = preload("res://Scenes/customers.tscn")
	customer = customer_scene.instantiate()
	
func _on_customer_spawn_button_pressed() -> void:
	get_tree().root.add_child(customer)
	customer.anim_plyr.play("customer_sld_in")
	
 #this function will eventyally be replaced by the cup
#func _on_has_finished_drink_button_pressed() -> void:
#	customer.cup.flavour = customer.flavour
		
