extends Node2D
@export var spwn_node : Node2D
var customer_scene
var customer
var a : int
func _ready() -> void:
	a = randi_range(90, 180)
	spawn_customer()
	child_spawn_timer()
	
func spawn_customer():
	customer_scene = preload("res://Scenes/customers.tscn")
	customer = customer_scene.instantiate()
	spwn_node.add_child(customer)
	#add_child(customer)
	customer.anim_plyr.play("customer_sld_in")
	
func child_spawn_timer():
	await get_tree().create_timer(a).timeout
	spawn_customer()
