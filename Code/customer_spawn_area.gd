extends Node2D
@export var customer_spwn_btn : Button
@export var has_fnshd_drnk_btn : Button
@export var spawn_area : Node2D
@export var ordering_area : Node2D
@export var exit_area : Node2D
@export var text_lable : Label
@export var  ok_btn : Button
@export var animplyr: AnimationPlayer
@export var protag_sprite : Sprite2D
@export var cstmr_sprite : Sprite2D
@onready var spawnpoint = spawn_area.global_position
@onready var ordering_point = ordering_area.global_position
@onready var exit_point = exit_area.global_position
var btn_times_pressed : int = 0
var customer_scene
var customer
var customer_node
var Game_protag
var has_finished_drink : bool = false

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
	
 #this function will eventyally be replaced by the cup
func _on_has_finished_drink_button_pressed() -> void:
	customer_node.correct_drink = true
	print(customer_node.correct_drink)
	
func _on_ok_btn_pressed() -> void:
	text_to_be_displayed("")
	animplyr.play("conver_end")
	await get_tree().create_timer(1).timeout
	ok_btn.hide()
	
func displaying_text():
	text_lable.visible_characters= 0
	for i in text_lable.text.length():
		text_lable.visible_characters += 1
		await get_tree().create_timer(0.04).timeout
		
func text_to_be_displayed(text : String):
	text_lable.text = text
	displaying_text()

func _on_exit_area_2d_body_entered(body: Node2D) -> void:
	get_tree().root.remove_child(body)
	#customer_node = null
	customer.has_ordered = false
	Game_protag.has_finished_drink = false

func _on_ordering_area_2d_body_entered(body: Node2D) -> void:
	if body == null:
		pass
	elif body is Cust0mers:
		print(body)
		customer_node = body
		if customer_node.has_ordered == false:
			text_lable.show()
			animplyr.play("conver_start")
			text_to_be_displayed("I want a " + body.temp + body.flavour + " please.")
			ok_btn.show()
			customer_node.has_ordered = true
			print(customer_node.has_ordered)
			print(customer_node.correct_drink)
			if customer_node.correct_drink == true:
				print(customer_node.correct_drink)
				print("Play drink has been made dialogue")
				text_to_be_displayed("Thanks!")
				await get_tree().create_timer(2).timeout
				customer.target_point = exit_point

func _on_ordering_area_2d_body_exited(body: Node2D) -> void:
	customer.has_ordered = false
	has_finished_drink = false
