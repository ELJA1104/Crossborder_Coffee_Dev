extends Node2D
@export var Pug_detec : Area2D
@export var Cup_detec : Area2D
@export var Cup_detection_value : int = 0
@export var cup_tp_pos: Node2D
@export var puck_tp_pos: Node2D
@export var Text_label : Label
var B : String
var is_filling : bool = false
var coffee_flavour
var req_temp
var Puck_detec : bool = false
var cup
var puck

func _physics_process(delta: float) -> void:
	if cup:
		if is_filling == true:
			cup.cup_fill()
			
		elif is_filling == false:
			cup.cup_stop_fill()
			
		if cup.Progress_Bar_cup.value >= 99:
			cup.menu_in_coffe()
			if Puck_detec == true:
				puck.used_once = true
			elif Puck_detec == false:
				pass
		elif cup.Progress_Bar_cup.value <= 99:
			pass

func _on_start_button_pressed() -> void:
	if puck.used_once == true:
		text_to_be_displayed("You need to clean out the puck")
	elif puck.used_once == false:
		if puck.is_empty == true:
			text_to_be_displayed("You need  to fill the puck with coffee grounds")
		elif puck.is_empty == false:
			if cup.hot_water_protocol == false and Puck_detec == false:
				text_to_be_displayed("This drink requires a Puck")
			elif cup.hot_water_protocol == true and Puck_detec == true:
				text_to_be_displayed("This drink does not require a puck")
			else:
				if Cup_detection_value == 1:
					print("start button is pressed")
					is_filling = true	
					text_to_be_displayed("Filling process has started")
				elif Cup_detection_value== 0:
					print("Something is missing!")
					text_to_be_displayed("Cup has not been detected")


func _on_stop_button_pressed() -> void:
	print("stop button is pressed")
	Cup_detection_value == 0
	is_filling = false

	text_to_be_displayed("Filling process has stopped")
	
func _on_cup_detection_body_entered(body) -> void:
	print(body)
	if body is Cup_node:
		cup = body
		coffee_flavour = body.flavour
		req_temp = body.temp
		print("Cup has been detected")
		Cup_detection_value = 1
		print(Cup_detection_value)
		text_to_be_displayed("Cup has been detected")
			
	elif body is Ethan_Puck:
		cup = null
		text_to_be_displayed("This is for the cup, not the puck")
	
func _on_cup_detection_body_exited(body) -> void:
	print(body)
	if body is Cup_node:
		cup = null
		coffee_flavour = null
		req_temp = null
		print("Cup has left")
		Cup_detection_value = 0
		print(Cup_detection_value)
		text_to_be_displayed("Cup has been taken away")
		is_filling = false
	else:
		pass
func displaying_text():
	Text_label.visible_characters= 0
	for i in Text_label.text.length():
		Text_label.visible_characters += 1
		await get_tree().create_timer(0.03).timeout
		
func text_to_be_displayed(text : String):
	Text_label.text = text
	displaying_text()

func _on_puck_detection_body_entered(body: CharacterBody2D) -> void:
	print(body)
	if body is Ethan_Puck:
		puck = body
		Puck_detec = true
		text_to_be_displayed("Puck has been detected")
	else:
		text_to_be_displayed("This is for the puck, not the cup")
	
func _on_puck_detection_body_exited(body: CharacterBody2D) -> void:
	print(body)
	if body is Ethan_Puck:
		puck = null
		Puck_detec = false
		text_to_be_displayed("Puck has been taken away")
