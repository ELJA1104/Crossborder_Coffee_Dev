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
var mouse_inside_cup : bool = false
var can_add_things : bool = false
var not_in_the_spwaner : bool = true
@export var Progress_Bar_cup : ProgressBar
@export var Text_label : Label
var flavour : String
var temp : String
var ran_ice  = 0
var ran_drink = 0
var _ingredians = 0
var nothing_loading : bool = true
var loading 

func _ready():
	$Area2D.body_entered.connect(_on_area_2d_body_entered)
	$Area2D.body_exited.connect(_on_area_2d_body_exited)
	mouse_entered.connect(_on_mouse_entered)
	mouse_exited.connect(_on_mouse_exited)
	Progress_Bar_cup.hide()
	drink_select()
	hot_or_iced()
	text_to_be_displayed(temp + flavour )
	



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
			if _ingredians == 1 :
				print('ice done')
				Progress_Bar_cup.hide()
				Progress_Bar_cup.value = 0
				can_add_things = false 
				ran_ice += 1
				hot_or_iced()
				ice_cube.tp_to_spwaner()
				nothing_loading = true
				menu_in_coffe()
			if _ingredians == 2:
				print('milk done')
				Progress_Bar_cup.hide()
				Progress_Bar_cup.value = 0
				can_add_things = false 
				ingredians_milk += 1
				milk.tp_to_spwaner()
				nothing_loading = true
				menu_in_coffe()
			if _ingredians == 3:
				print('sugar done')
				Progress_Bar_cup.hide()
				Progress_Bar_cup.value = 0
				can_add_things = false 
				ingredians_sugar += 1
				sugar.tp_to_spwaner()
				nothing_loading = true
				menu_in_coffe()
			if _ingredians == 4:
				print('milk foam done')
				Progress_Bar_cup.hide()
				Progress_Bar_cup.value = 0
				can_add_things = false 
				ingredians_milk_foam += 1
				milk_foam.tp_to_spwaner()
				nothing_loading = true
				menu_in_coffe()
			if _ingredians == 5:
				print('cocoa powder done')
				Progress_Bar_cup.hide()
				Progress_Bar_cup.value = 0
				can_add_things = false 
				ingredians_cocoa_powder += 1
				cocoa_powder.tp_to_spwaner()
				nothing_loading = true
				menu_in_coffe()
			if _ingredians == 6:
				print('matcha powder done')
				Progress_Bar_cup.hide()
				Progress_Bar_cup.value = 0
				can_add_things = false 
				ingredians_matcha_powder += 1
				matcha_powder.tp_to_spwaner()
				nothing_loading = true
				menu_in_coffe()
			if _ingredians == 7:
				print('cinnamon powder done')
				Progress_Bar_cup.hide()
				Progress_Bar_cup.value = 0
				can_add_things = false 
				ingredians_cinnamon_powder += 1
				cinnamon_powder.tp_to_spwaner()
				nothing_loading = true
				menu_in_coffe()




func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed and mouse_inside_cup:
			when_is_grab_cup = true
		else:
			when_is_grab_cup = false
			
func _on_mouse_entered():
	mouse_inside_cup = true
	

func _on_mouse_exited():
	mouse_inside_cup = false
	
	


#========================================================================================

func cup_fill():
	Progress_Bar_cup.show()
	Progress_Bar_cup.value += 0.5
	pass
	
func cup_stop_fill():
	Progress_Bar_cup.show()
	Progress_Bar_cup.value += 0
	pass
	
func cup_return_to_zero():
	Progress_Bar_cup.hide()
	Progress_Bar_cup.value = 0
	pass

func add_coffee():
	coffee += 1
	menu_in_coffe()
#=================================================================================================================================================================
#_ingredians :
#ice cube = 1
#milk = 2
#sugar = 3
#milk foam = 4
#cocoa powder = 5
#matcha powder = 6
#cinnamon_powder = 7
func _on_area_2d_body_entered(body):
	can_add_things = true
	Progress_Bar_cup.show()
	print(body.name)
	if nothing_loading:
		if body is Ice_cube_node:
			ice_cube = body
			_ingredians = 1
			loading = body
		if body is Milk_node:
			milk = body
			_ingredians = 2
			loading = body
		if body is Sugar_node:
			sugar = body
			_ingredians = 3
			loading = body
		if body is Milk_foam_node:
			milk_foam = body
			_ingredians = 4
			loading = body
		if body is Cocoa_powder_node:
			cocoa_powder = body
			_ingredians = 5
			loading = body
		if body is Matcha_powder_node:
			matcha_powder = body
			_ingredians = 6
			loading = body
		if body is Cinnamon_powder_node:
			cinnamon_powder = body
			_ingredians = 7
			loading = body


func _on_area_2d_body_exited(body):
	if body == loading:
		can_add_things = false
		Progress_Bar_cup.hide()
		Progress_Bar_cup.value = 0
		print(body.name + 'is go out')
	else:
		pass


func is_in_spwaner():
	not_in_the_spwaner = false

func is_not_in_spwaner():
	not_in_the_spwaner = true
#======================================================================
var coffee = 0
var ingredians_milk = 0
var ingredians_sugar = 0
var ingredians_milk_foam = 0
var ingredians_cocoa_powder = 0
var ingredians_matcha_powder = 0
var ingredians_cinnamon_powder = 0
func menu_in_coffe():
	if coffee == 0 and ingredians_milk == 0 and ingredians_sugar == 0 and ingredians_milk_foam == 0 and ingredians_cocoa_powder == 0 and ingredians_matcha_powder == 0 and ingredians_cinnamon_powder == 0 :
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

	if temp == "Cold " and flavour == "Water":
		temp = "Cold  "
	if temp == "Hot " and flavour == "Water":
		temp = "Hot  "
	text_to_be_displayed(temp + flavour )
	
func displaying_text():
	Text_label.visible_characters= 0
	for i in Text_label.text.length():
		Text_label.visible_characters += 1
		await get_tree().create_timer(0.03).timeout
		
func text_to_be_displayed(text : String):
	Text_label.text = text
	displaying_text()

#=============================================================







	
