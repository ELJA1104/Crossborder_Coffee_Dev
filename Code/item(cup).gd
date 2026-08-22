extends CharacterBody2D
class_name Cup_node
var ice_cube
var milk
var sugar
var milk_foam
var cocoa_powder
var matcha_powder
var cinnamon_powder
var when_is_grab_cup : bool = false
var can_add_things : bool = false
var not_in_the_spwaner : bool = true
var not_in_other_spwaner : bool = true
@export var Progress_Bar_cup : ProgressBar
@export var Text_label : Label
var flavour : String
var temp : String
var ran_ice  = 0
var ran_drink = 0
var _ingredians = 0
var nothing_loading : bool = true
var target_ingredient_type = 0
var loading 
var coffee = 0
var ingredians_milk = 0
var ingredians_sugar = 0
var ingredians_milk_foam = 0
var ingredians_cocoa_powder = 0
var ingredians_matcha_powder = 0
var ingredians_cinnamon_powder = 0
@export var other_cup_detect_radius: float = 100

func _ready():
	input_pickable = true
	input_event.connect(_on_input_event)
	$Area2D.body_entered.connect(_on_area_2d_body_entered)
	$Area2D.body_exited.connect(_on_area_2d_body_exited)
	Progress_Bar_cup.hide()
	drink_select()
	hot_or_iced()
	text_to_be_displayed(temp + flavour)

func _process(_delta):
	if when_is_grab_cup:
		var _mouse_pos = get_global_mouse_position()
		global_position = lerp(global_position,_mouse_pos,0.2)
		return

	if can_add_things and Progress_Bar_cup.visible and not_in_the_spwaner:
		nothing_loading = false
		if Progress_Bar_cup.value < Progress_Bar_cup.max_value:
			Progress_Bar_cup.value += 0.5
		else:
			if _ingredians == 1:
				print('ice done')
				Progress_Bar_cup.hide()
				Progress_Bar_cup.value = 0
				can_add_things = false 
				ran_ice += 1
				hot_or_iced()
				if ice_cube: 
					ice_cube.tp_to_spwaner()
				nothing_loading = true
				menu_in_coffe()
			if _ingredians == 2:
				print('milk done')
				Progress_Bar_cup.hide()
				Progress_Bar_cup.value = 0
				can_add_things = false 
				ingredians_milk += 1
				if milk: 
					milk.tp_to_spwaner()
				nothing_loading = true
				menu_in_coffe()
			if _ingredians == 3:
				print('sugar done')
				Progress_Bar_cup.hide()
				Progress_Bar_cup.value = 0
				can_add_things = false 
				ingredians_sugar += 1
				if sugar: 
					sugar.tp_to_spwaner()
				nothing_loading = true
				menu_in_coffe()
			if _ingredians == 4:
				print('milk foam done')
				Progress_Bar_cup.hide()
				Progress_Bar_cup.value = 0
				can_add_things = false 
				ingredians_milk_foam += 1
				if milk_foam: 
					milk_foam.tp_to_spwaner()
				nothing_loading = true
				menu_in_coffe()
			if _ingredians == 5:
				print('cocoa powder done')
				Progress_Bar_cup.hide()
				Progress_Bar_cup.value = 0
				can_add_things = false 
				ingredians_cocoa_powder += 1
				if cocoa_powder: 
					cocoa_powder.tp_to_spwaner()
				nothing_loading = true
				menu_in_coffe()
			if _ingredians == 6:
				print('matcha powder done')
				Progress_Bar_cup.hide()
				Progress_Bar_cup.value = 0
				can_add_things = false 
				ingredians_matcha_powder += 1
				if matcha_powder: 
					matcha_powder.tp_to_spwaner()
				nothing_loading = true
				menu_in_coffe()
			if _ingredians == 7:
				print('cinnamon powder done')
				Progress_Bar_cup.hide()
				Progress_Bar_cup.value = 0
				can_add_things = false 
				ingredians_cinnamon_powder += 1
				if cinnamon_powder: 
					cinnamon_powder.tp_to_spwaner()
				nothing_loading = true
				menu_in_coffe() 

func _on_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			when_is_grab_cup = true
			get_viewport().set_input_as_handled()

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if not event.pressed and when_is_grab_cup:
			when_is_grab_cup = false
			move_to_front() 

func is_other_cup_nearby() -> bool:
	var all_cups = get_tree().get_nodes_in_group("cups")
	for cupss in all_cups:
		if cupss != self and is_instance_valid(cupss):
			if global_position.distance_to(cupss.global_position) <= other_cup_detect_radius:
				return true
	return false

func tp_to_spwaner():
	var _spwaner = $"../spwaner(cup）"
	if _spwaner:
		global_position = _spwaner.global_position

#========================================================================================

func cup_fill():
	Progress_Bar_cup.show()
	Progress_Bar_cup.value += 0.5
	if Progress_Bar_cup.value == 100:
		add_coffee()
		cup_return_to_zero()

func cup_stop_fill():
	Progress_Bar_cup.show()
	Progress_Bar_cup.value += 0

func cup_return_to_zero():
	Progress_Bar_cup.hide()
	Progress_Bar_cup.value = 0

func add_coffee():
	coffee += 1
	menu_in_coffe()

#========================================================================================
#target_ingredient_type :
#ice=1
#milk=2
#sugar=3
#cream=4
#coco=5
#matcha=6
#cinimond=7
func _on_area_2d_body_entered(body):
	print(body.name)
	if nothing_loading:
		if body is Ice_cube_node: 
			target_ingredient_type = 1
		elif body is Milk_node: 
			target_ingredient_type = 2
		elif body is Sugar_node: 
			target_ingredient_type = 3
		elif body is Milk_foam_node: 
			target_ingredient_type = 4
		elif body is Cocoa_powder_node:
			target_ingredient_type = 5
		elif body is Matcha_powder_node: 
			target_ingredient_type = 6
		elif body is Cinnamon_powder_node: 
			target_ingredient_type = 7
		
		if target_ingredient_type != 0:
			can_add_things = true
			Progress_Bar_cup.show()
			_ingredians = target_ingredient_type
			loading = body
			if target_ingredient_type == 1: 
				ice_cube = body
			elif target_ingredient_type == 2: 
				milk = body
			elif target_ingredient_type == 3: 
				sugar = body
			elif target_ingredient_type == 4: 
				milk_foam = body
			elif target_ingredient_type == 5: 
				cocoa_powder = body
			elif target_ingredient_type == 6: 
				matcha_powder = body
			elif target_ingredient_type == 7: 
				cinnamon_powder = body

func _on_area_2d_body_exited(body):
	if body == loading:
		can_add_things = false
		Progress_Bar_cup.hide()
		Progress_Bar_cup.value = 0
		nothing_loading = true
		loading = null
		print(body.name + 'is go out')

func cup_is_in_spwaner():
	nothing_loading = false
	ran_drink = 0
	ran_ice = 0
	text_to_be_displayed('awa')
	await get_tree().create_timer(3).timeout
	when_is_grab_cup = false
	tp_to_spwaner()
	hot_or_iced()
	drink_select()

#======================================================================

func menu_in_coffe():
	print("coffee in menu")
	if coffee == 0 and ingredians_milk == 0 and ingredians_sugar == 0 and ingredians_milk_foam == 0 and ingredians_cocoa_powder == 0 and ingredians_matcha_powder == 0 and ingredians_cinnamon_powder == 0:
		ran_drink = 0
		drink_select()
	elif coffee == 1 and ingredians_milk == 0 and ingredians_sugar == 0 and ingredians_milk_foam == 0 and ingredians_cocoa_powder == 0 and ingredians_matcha_powder == 0 and ingredians_cinnamon_powder == 0 :
		ran_drink = 1
		drink_select()
	elif coffee == 2 and ingredians_milk == 0 and ingredians_sugar == 0 and ingredians_milk_foam == 0 and ingredians_cocoa_powder == 0 and ingredians_matcha_powder == 0 and ingredians_cinnamon_powder == 0 :
		ran_drink = 2
		drink_select()
	elif coffee == 3 and ingredians_milk == 0 and ingredians_sugar == 0 and ingredians_milk_foam == 0 and ingredians_cocoa_powder == 0 and ingredians_matcha_powder == 0 and ingredians_cinnamon_powder == 0 :
		ran_drink = 3
		drink_select()
	elif coffee == 2 and ingredians_milk == 2 and ingredians_sugar == 0 and ingredians_milk_foam == 0 and ingredians_cocoa_powder == 0 and ingredians_matcha_powder == 0 and ingredians_cinnamon_powder == 0 :
		ran_drink = 4
		drink_select()
	elif coffee == 2 and ingredians_milk == 2 and ingredians_sugar == 0 and ingredians_milk_foam == 1 and ingredians_cocoa_powder == 0 and ingredians_matcha_powder == 0 and ingredians_cinnamon_powder == 0 :
		ran_drink = 5
		drink_select()
	elif coffee == 2 and ingredians_milk == 2 and ingredians_sugar == 0 and ingredians_milk_foam == 0 and ingredians_cocoa_powder == 1 and ingredians_matcha_powder == 0 and ingredians_cinnamon_powder == 0 :
		ran_drink = 6
		drink_select()
	elif coffee == 2 and ingredians_milk == 2 and ingredians_sugar == 4 and ingredians_milk_foam == 1 and ingredians_cocoa_powder == 0 and ingredians_matcha_powder == 0 and ingredians_cinnamon_powder == 0 :
		ran_drink = 7
		drink_select()
	elif coffee == 2 and ingredians_milk == 2 and ingredians_sugar == 3 and ingredians_milk_foam == 0 and ingredians_cocoa_powder == 0 and ingredians_matcha_powder == 0 and ingredians_cinnamon_powder == 0 :
		ran_drink = 8
		drink_select()
	elif coffee == 2 and ingredians_milk == 2 and ingredians_sugar == 5 and ingredians_milk_foam == 0 and ingredians_cocoa_powder == 0 and ingredians_matcha_powder == 0 and ingredians_cinnamon_powder == 0 :
		ran_drink = 9
		drink_select()
	elif coffee == 1 and ingredians_milk == 3 and ingredians_sugar == 0 and ingredians_milk_foam == 0 and ingredians_cocoa_powder == 0 and ingredians_matcha_powder == 0 and ingredians_cinnamon_powder == 0 :
		ran_drink = 10
		drink_select()
	elif coffee == 1 and ingredians_milk == 1 and ingredians_sugar == 1 and ingredians_milk_foam == 0 and ingredians_cocoa_powder == 0 and ingredians_matcha_powder == 0 and ingredians_cinnamon_powder == 0 :
		ran_drink = 11
		drink_select()
	elif coffee == 2 and ingredians_milk == 2 and ingredians_sugar == 0 and ingredians_milk_foam == 0 and ingredians_cocoa_powder == 0 and ingredians_matcha_powder == 1 and ingredians_cinnamon_powder == 0 :
		ran_drink = 12
		drink_select()
	elif coffee == 1 and ingredians_milk == 2 and ingredians_sugar == 0 and ingredians_milk_foam == 0 and ingredians_cocoa_powder == 0 and ingredians_matcha_powder == 0 and ingredians_cinnamon_powder == 1 :
		ran_drink = 13
		drink_select()
	elif coffee == 2 and ingredians_milk == 2 and ingredians_sugar == 4 and ingredians_milk_foam == 2 and ingredians_cocoa_powder == 0 and ingredians_matcha_powder == 0 and ingredians_cinnamon_powder == 0 :
		ran_drink = 14
		drink_select()
	elif coffee == 2 and ingredians_milk == 2 and ingredians_sugar == 0 and ingredians_milk_foam == 3 and ingredians_cocoa_powder == 1 and ingredians_matcha_powder == 0 and ingredians_cinnamon_powder == 0 :
		ran_drink = 15
		drink_select()
	elif coffee == 2 and ingredians_milk == 2 and ingredians_sugar == 2 and ingredians_milk_foam == 1 and ingredians_cocoa_powder == 0 and ingredians_matcha_powder == 0 and ingredians_cinnamon_powder == 0 :
		ran_drink = 16
		drink_select()
	elif coffee == 3 and ingredians_milk == 1 and ingredians_sugar == 5 and ingredians_milk_foam == 0 and ingredians_cocoa_powder == 0 and ingredians_matcha_powder == 0 and ingredians_cinnamon_powder == 1 :
		ran_drink = 17
		drink_select()
	else:
		ran_drink = -1
		drink_select()

func drink_select():
	if ran_drink == 0:
		flavour = "Water"
	elif ran_drink == -1:
		flavour = "Unidentified liquid (potentially toxic)"
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
	elif ran_drink == 17:
		flavour = "???"
	text_to_be_displayed(temp + flavour)

func update_drink_recipe():
	menu_in_coffe()
	hot_or_iced()

func hot_or_iced():
	if ran_ice == 0:
		print('hot temp')
		temp = "Hot "
	elif ran_ice == 1:
		print('normal temp')
		temp = "Warm "
	elif ran_ice == 2:
		print('cold temp')
		temp = "Cold "
	else:
		temp = "Cold "
	text_to_be_displayed(temp + flavour)


func displaying_text():
	Text_label.visible_characters = 0
	for i in Text_label.text.length():
		Text_label.visible_characters += 1
		await get_tree().create_timer(0.03).timeout
	
func text_to_be_displayed(text : String):
	Text_label.text = text
	displaying_text()
