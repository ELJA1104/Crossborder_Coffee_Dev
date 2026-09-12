extends Node2D
class_name  Cust0mers
@export var text_lable : Label
@export var anim_plyr : AnimationPlayer
@export var label : Label
var ran_drink : int
var flavour
var customer_dialogue
var start_conver : bool = false
var times_up : bool = false
var cup
var ran_ice : int
var temp
var b : int
var confrimation = 0
var customer_spawner
var price : int
func displaying_text():
	text_lable.visible_characters= 0
	for i in text_lable.text.length():
		text_lable.visible_characters += 1
		await get_tree().create_timer(0.04).timeout
		
func text_to_be_displayed(text : String):
	text_lable.text = text
	displaying_text()

func customer_wait_time():
	await get_tree().create_timer(300).timeout
	times_up = true
	print(times_up)
	text_to_be_displayed("Too slow man, bye")
	await get_tree().create_timer(2).timeout
	anim_plyr.play("customer_exit")

func drink_select():
	ran_drink = randi_range(0, 16)
	if ran_drink == 0:
		flavour = "Water"
		price = 50
	elif ran_drink == 1:
		flavour = "Plain Coffee"
		price = 150
	elif ran_drink == 2:
		flavour = "Espresso"
		price = 450
	elif ran_drink == 3:
		flavour = "Double Espresso"
		price = 550
	elif ran_drink == 4:
		flavour = "Caffè Latte"
		price = 1050
	elif ran_drink == 5:
		flavour = "Cappuccino"
		price = 1050
	elif ran_drink == 6:
		flavour = "Mocha"
		price = 1350
	elif ran_drink == 7:
		flavour = "Caramel Macchiato"
		price = 1250
	elif ran_drink == 8:
		flavour = "Vanilla Latte"
		price = 1100
	elif ran_drink == 9:
		flavour = "Hazelnut Latte"
		price = 1100
	elif ran_drink == 10:
		flavour = "Vietnamese Coffee"
		price = 1200
	elif ran_drink == 11:
		flavour = "Hong Kong–Style Milk Coffee"
		price = 1150
	elif ran_drink == 12:
		flavour = "Matcha Coffee"
		price = 1200
	elif ran_drink == 13:
		flavour = "Cinnamon Coffee"
		price = 1650
	elif ran_drink == 14:
		flavour = "Caramel Foam Coffee"
		price = 1750
	elif ran_drink == 15:
		flavour = "Chocolate Cream Coffee"
		price = 1400
	elif ran_drink == 16:
		flavour = "Sweet Foam Latte"
		price = 1600
		
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
	print(temp + flavour)
	print(customer_spawner)
	print(price)

func _on_area_2d_body_entered(body: Node2D) -> void:
	if times_up == true:
		body = null
	elif times_up == false:
		if body is Cup_node:
			cup = body
			if body.flavour == flavour:
				if body.temp == temp:
					body.queue_free()
					text_to_be_displayed("Thank you!")
					label.add_theme_color_override("font_color", Color.GREEN)
					text_box("Success!")
					confrimation = 1
					customer_spawner.customer_served_count += 1
					customer_spawner.credits_earned += price
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
		customer_wait_time()
		timer()
	elif anim_name == "customer_exit":
		queue_free()
		
func timer():
	b = 300
	label.add_theme_color_override("font_color", Color.YELLOW)
	text_box("Prepare and serve drink in " + str(b) +" Seconds")
	for i in range (b):
		if confrimation == 0:
			if b >= 1:
				await get_tree().create_timer(1).timeout
				b -= 1
				label.add_theme_color_override("font_color", Color.YELLOW)
				text_box("Prepare and serve drink in " + str(b) +" Seconds")
			elif b == 0:
				label.add_theme_color_override("font_color", Color.RED)
				text_box("You failed!")
				await get_tree().create_timer(2).timeout
				text_box("")
		if confrimation != 0:
			text_box("")
			break

func text_box(text_wt):
	label.text = text_wt
