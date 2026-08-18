extends Node2D
class_name  Cust0mers
@export var text_lable : Label
@export var anim_plyr : AnimationPlayer
var ran_drink : int
var flavour
var correct_drink : bool = false
var customer_dialogue
var start_conver : bool = false
var cup

func displaying_text():
	text_lable.visible_characters= 0
	for i in text_lable.text.length():
		text_lable.visible_characters += 1
		await get_tree().create_timer(0.04).timeout
		
func text_to_be_displayed(text : String):
	text_lable.text = text
	displaying_text()

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
		
func _ready() -> void:
	drink_select()
	customer_conver()
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Cup_node:
		cup = body
		if body.flavour == flavour:
			print("yay")
			print("Play drink has been made dialogue")
			await get_tree().create_timer(0.04).timeout
			anim_plyr.play("customer_exit")
			#correct_drink = true
		elif body.flavour != flavour:
			print("Wrong drink man")

func _on_area_2d_body_exited(body: Node2D) -> void:
	body = null
	
func customer_conver():
	customer_dialogue = "I want a " + flavour + " please."

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "customer_sld_in":
		text_to_be_displayed(customer_dialogue)
	elif anim_name == "customer_exit":
		queue_free()
