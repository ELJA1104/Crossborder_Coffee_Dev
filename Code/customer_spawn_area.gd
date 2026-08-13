extends Node2D
@export var customer_spwn_btn : Button
@export var has_fnshd_drnk_btn : Button
@export var spawn_area : Node2D
@export var ordering_area : Node2D
@export var exit_area : Node2D
@onready var spawnpoint = spawn_area.global_position
@onready var ordering_point = ordering_area.global_position
@onready var exit_point = exit_area.global_position
var customer_scene
var customer
var Game_protag
var customer_node

func _ready() -> void:
	customer_scene = preload("res://Scenes/customers.tscn")

func _process(delta: float) -> void:
	customer = customer_scene.instantiate()
	
func _on_customer_spawn_button_pressed() -> void:
	customer.global_position = spawnpoint
	get_tree().root.add_child(customer)
	customer.target = ordering_point
	customer.velocity = position.direction_to(ordering_point) * customer.speed



func _on_has_finished_drink_button_pressed() -> void:
	Game_protag.has_finished_drink = true


func _on_protag_area_body_entered(body: Node2D) -> void:
	Game_protag = body


func _on_customer_detec_area_body_entered(body: Node2D) -> void:
	print(body)
	if body is Cust0mers:
		customer_node = body
		print(customer_node.temp + customer_node.flavour)


func _on_customer_detec_area_body_exited(body: Node2D) -> void:
	if body is Cust0mers:
		customer_node = null	
