extends Node2D
@export var customer_spwn_btn : Button
@export var has_fnshd_drnk_btn : Button
@export var spawn_area : Node2D
@export var ordering_area : Node2D
@export var exit_area : Node2D
@export var text_lable : Label
@export var  ok_btn : Button
@onready var spawnpoint = spawn_area.global_position
@onready var ordering_point = ordering_area.global_position
@onready var exit_point = exit_area.global_position
var btn_times_pressed : int = 0
var customer_scene
var customer
var Game_protag
var customer_node

func _ready() -> void:
	customer_scene = preload("res://Scenes/customers.tscn")
	text_lable.hide()
	ok_btn.hide()

func _process(delta: float) -> void:
	customer = customer_scene.instantiate()
	
func _on_customer_spawn_button_pressed() -> void:
	customer.global_position = spawnpoint
	get_tree().root.add_child(customer)
	customer.target_point = ordering_point
	print(customer.target_point)

func _on_has_finished_drink_button_pressed() -> void:
	Game_protag.has_finished_drink = true


func _on_protag_area_body_entered(body: Node2D) -> void:
	if body is Game_Protagonist:
		Game_protag = body
		print(Game_protag)


func _on_customer_detec_area_body_entered(body: Node2D) -> void:
	print(body)
	if body is Cust0mers:
		customer_node = body
		print(customer_node.temp + customer_node.flavour)


func _on_customer_detec_area_body_exited(body: Node2D) -> void:
	ok_btn.hide()
	text_lable.hide()
	text_lable.text = ""
	if body is Cust0mers:
		customer_node = null
	customer.has_ordered = false
	customer.has_recieved_order = false
	Game_protag.has_finished_drink = false
func _on_serve_area_body_entered(body: Node2D) -> void:
	if customer_node == null:
		pass
	elif customer_node is Cust0mers:
		if customer.has_ordered == false:
			text_lable.show()
			text_to_be_displayed("I want a " + customer_node.temp + customer_node.flavour + " please.")
			ok_btn.show()
			customer.has_ordered = true
		if customer.has_ordered == true:
			if customer.has_recieved_order == false and Game_protag.has_finished_drink == true:
				print("Play drink has been made dialogue")
				customer.has_recieved_order = true
			if customer.has_recieved_order == true:
				text_to_be_displayed("Thanks!")
				await get_tree().create_timer(3).timeout
				customer_node.target_point = exit_point


func _on_serve_area_body_exited(body: Node2D) -> void:
	pass # Replace with function body.

func _on_ok_btn_pressed() -> void:
	text_to_be_displayed("")
	
func displaying_text():
	text_lable.visible_characters= 0
	for i in text_lable.text.length():
		text_lable.visible_characters += 1
		await get_tree().create_timer(0.03).timeout
		
func text_to_be_displayed(text : String):
	text_lable.text = text
	displaying_text()

func _on_exit_area_2d_body_entered(body: Node2D) -> void:
	get_tree().root.remove_child(body)
