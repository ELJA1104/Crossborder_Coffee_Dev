extends Node2D
class_name  Customer_Spawner
@export var spwn_node : Node2D
var customer_scene
var customer
var customer_spawn_rate = randi_range(150, 300)

func _ready() -> void:
	spawn_customer()
	child_spawn_timer()
	print(get_child_count())
	
func _physics_process(_delta: float) -> void:
	pass
	
func spawn_customer():
	customer_scene = preload("res://Scenes/customers.tscn")
	customer = customer_scene.instantiate()
	spwn_node.add_child(customer)
	customer.anim_plyr.play("customer_sld_in")
		
func child_spawn_timer():
	await get_tree().create_timer(customer_spawn_rate).timeout
	spawn_customer()
