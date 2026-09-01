extends Node2D
class_name  Cust0mers
@export var text_lable : Label
@export var anim_plyr : AnimationPlayer
var ran_drink : int
var flavour
var correct_drink : bool = false
var customer_dialogue
var start_conver : bool = false
var times_up : bool = false
var cup
var ran_ice : int
var temp

func displaying_text():
	text_lable.visible_characters= 0
	for i in text_lable.text.length():
		text_lable.visible_characters += 1
		await get_tree().create_timer(0.04).timeout
		
func text_to_be_displayed(text : String):
	text_lable.text = text
	displaying_text()

func customer_wait_time():
	await get_tree().create_timer(60).timeout
	times_up = true
	print(times_up)
	text_to_be_displayed("Too slow man, bye")
	await get_tree().create_timer(2).timeout
	anim_plyr.play("customer_exit")

func drink_select():
	ran_drink = randi_range(0, 16)
	if ran_drink == 0:
		flavour = "Water"
	elif ran_drink == 1:
		flavour = "Plain Coffee"
	elif ran_drink == 2:
		flavour = "Espresso"
	elif ran_drink == 3:
		flavour = "Double Espresso"
	elif ran_drink == 4:
		flavour = "Caffè Latte"
	elif ran_drink == 5:
		flavour = "Cappuccino"
	elif ran_drink == 6:
		flavour = "Mocha"
	elif ran_drink == 7:
		flavour = "Caramel Macchiato"
	elif ran_drink == 8:
		flavour = "Vanilla Latte"
	elif ran_drink == 9:
		flavour = "Hazelnut Latte"
	elif ran_drink == 10:
		flavour = "Vietnamese Coffee"
	elif ran_drink == 11:
		flavour = "Hong Kong–Style Milk Coffee"
	elif ran_drink == 12:
		flavour = "Matcha Coffee"
	elif ran_drink == 13:
		flavour = "Cinnamon Coffee"
	elif ran_drink == 14:
		flavour = "Caramel Foam Coffee"
	elif ran_drink == 15:
		flavour = "Chocolate Cream Coffee"
	elif ran_drink == 16:
		flavour = "Sweet Foam Latte"
		
func hot_or_iced():
	ran_ice = randi_range(0, 2)
	if ran_ice == 0:
		temp = "Hot "
	elif ran_ice == 1:
		temp = "Warm "
	elif ran_ice == 2:
		temp = "Cold "
		
func _ready() -> void:
	drink_select()
	hot_or_iced()
	customer_conver()
	customer_wait_time()
	print(temp + flavour)

func _on_area_2d_body_entered(body: Node2D) -> void:
	if times_up == true:
		body = null
	elif times_up == false:
		if body is Cup_node:
			cup = body
			if body.flavour == flavour:
				if body.temp == temp:
					print("yay")
					body.queue_free()
					text_to_be_displayed("Thank you!")
					await get_tree().create_timer(2).timeout
					anim_plyr.play("customer_exit")
					text_to_be_displayed("")
				elif body.temp != temp:
					text_to_be_displayed("This is not the right temperature")
					await get_tree().create_timer(1).timeout
					text_to_be_displayed(customer_dialogue)
			elif body.flavour != flavour:
				text_to_be_displayed("Wrong drink man")
				await get_tree().create_timer(1).timeout
				text_to_be_displayed(customer_dialogue)

func _on_area_2d_body_exited(body: Node2D) -> void:
	body = null
	
func customer_conver():
	customer_dialogue = "I want a " + temp + flavour + " please."

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "customer_sld_in":
		text_to_be_displayed(customer_dialogue)
	elif anim_name == "customer_exit":
		queue_free()
