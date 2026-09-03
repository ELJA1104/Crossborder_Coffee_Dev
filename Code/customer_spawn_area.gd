extends Node2D
@export var spwn_node : Node2D
@export var label : Label
var customer_scene
var customer
var a : int
var b = 60
var text_wt
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
	await get_tree().create_timer(4).timeout
	timer()

	
func child_spawn_timer():
	await get_tree().create_timer(a).timeout
	spawn_customer()
	
func timer():
	for i in b:
		text_wt = "Prepare and serve drink in " + str(b) +"S"
		label.text = text_wt
		await get_tree().create_timer(1).timeout
		b -= 1
