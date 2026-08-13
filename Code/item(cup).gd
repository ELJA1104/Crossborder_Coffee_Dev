extends CharacterBody2D
class_name Cup_node
var ice_cube
var milk
var sugar
var milk_foam
var cocoa_powder
var chocolate_sauce
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
			if _ingredians == 2:
				print('milk done')
				Progress_Bar_cup.hide()
				Progress_Bar_cup.value = 0
				can_add_things = false 
				ingredians_milk += 1
				milk.tp_to_spwaner()
				nothing_loading = true
			if _ingredians == 3:
				print('sugar done')
				Progress_Bar_cup.hide()
				Progress_Bar_cup.value = 0
				can_add_things = false 
				ingredians_sugar += 1
				sugar.tp_to_spwaner()
				nothing_loading = true
			if _ingredians == 4:
				print('milk foam done')
				Progress_Bar_cup.hide()
				Progress_Bar_cup.value = 0
				can_add_things = false 
				ingredians_milk_foam += 1
				milk_foam.tp_to_spwaner()
				nothing_loading = true
			if _ingredians == 5:
				print('cocoa powder done')
				Progress_Bar_cup.hide()
				Progress_Bar_cup.value = 0
				can_add_things = false 
				ingredians_cocoa_powder += 1
				cocoa_powder.tp_to_spwaner()
				nothing_loading = true
			if _ingredians == 6:
				print('chocolate sauce done')
				Progress_Bar_cup.hide()
				Progress_Bar_cup.value = 0
				can_add_things = false 
				ingredians_chocolate_sauce += 1
				chocolate_sauce.tp_to_spwaner()
				nothing_loading = true
			if _ingredians == 7:
				print('matcha powder done')
				Progress_Bar_cup.hide()
				Progress_Bar_cup.value = 0
				can_add_things = false 
				ingredians_matcha_powder += 1
				matcha_powder.tp_to_spwaner()
				nothing_loading = true
			if _ingredians == 8:
				print('cinnamon powder done')
				Progress_Bar_cup.hide()
				Progress_Bar_cup.value = 0
				can_add_things = false 
				ingredians_cinnamon_powder += 1
				cinnamon_powder.tp_to_spwaner()
				nothing_loading = true




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
#=================================================================================================================================================================
#_ingredians :
#ice cube = 1
#milk = 2
#sugar = 3
#milk foam = 4
#cocoa powder = 5
#chocolate sauce = 6
#matcha powder = 7
#cinnamon_powder = 8
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
		if body is Chocolate_sauce_node:
			chocolate_sauce = body
			_ingredians = 6
			loading = body
		if body is Matcha_powder_node:
			matcha_powder = body
			_ingredians = 7
			loading = body
		if body is Cinnamon_powder_node:
			cinnamon_powder = body
			_ingredians = 8
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
var ingredians_milk = 0
var ingredians_sugar = 0
var ingredians_milk_foam = 0
var ingredians_cocoa_powder = 0
var ingredians_chocolate_sauce = 0
var ingredians_matcha_powder = 0
var ingredians_cinnamon_powder = 0

func drink_select():
	if ran_drink == 0:
		flavour = "Water"
	elif ran_drink == -1:
			flavour = "Unidentified liquid (potentially toxic)"
	elif ran_drink == 1:
			flavour = "Ground Brew Coffee"
	elif ran_drink == 2:
		flavour = "Americano"
	elif ran_drink == 3:
		flavour = "Double Americano"
	elif ran_drink == 4:
		flavour = "Sweet Ground Brew"
	elif ran_drink == 5:
		flavour = "Sweet Americano"
	elif ran_drink == 6:
		flavour = "Cinnamon Americano"
	elif ran_drink == 7:
		flavour = "Aqua Milk Latte"
	elif ran_drink == 8:
		flavour = "Caffè Latte"
	elif ran_drink == 9:
		flavour = "Smooth Cream Coffee"
	elif ran_drink == 10:
		flavour = "Vanilla Americano"
	elif ran_drink == 11:
		flavour = "Double Aqua Milk"
	elif ran_drink == 12:
		flavour = "Double Espresso Latte"
	elif ran_drink == 13:
		flavour = "Double Cream Coffee"
	elif ran_drink == 14:
		flavour = "Aqua Sweet Latte"
	elif ran_drink == 15:
		flavour = "Evaporated Aqua Coffee"
	elif ran_drink == 16:
		flavour = "Condensed Latte"
	elif ran_drink == 17:
		flavour = "Aqua Cocoa Coffee"
	elif ran_drink == 18:
		flavour = "Aqua Matcha Coffee"
	elif ran_drink == 19:
		flavour = "Aqua Cinnamon Latte"
	elif ran_drink == 20:
		flavour = "Caramel Americano"
	elif ran_drink == 21:
		flavour = "Sweet Latte"
	elif ran_drink == 22:
		flavour = "vaporated Americano"
	elif ran_drink == 23:
		flavour = "Evaporated Americano"
	elif ran_drink == 24:
		flavour = "Cinnamon Latte"
	elif ran_drink == 25:
		flavour = "Caffè Mocha"
	elif ran_drink == 26:
		flavour = "Cocoa Latte"
	elif ran_drink == 27:
		flavour = "Matcha Latte"
	elif ran_drink == 28:
		flavour = "Cappuccino"
	elif ran_drink == 29:
		flavour = "Hazelnut Americano"
	elif ran_drink == 30:
		flavour = "Vanilla Latte"
	elif ran_drink == 31:
		flavour = "Aqua Vanilla Latte"
	elif ran_drink == 32:
		flavour = "Spanish Coffee"
	elif ran_drink == 33:
		flavour = "Thick Foam Latte"
	elif ran_drink == 34:
		flavour = "Double Vanilla Latte"
	elif ran_drink == 35:
		flavour = "Caramel Latte"
	elif ran_drink == 36:
		flavour = "Aqua Caramel Latte"
	elif ran_drink == 37:
		flavour = "Vanilla Evaporated Coffee"
	elif ran_drink == 38:
		flavour = "Vanilla Condensed Coffee"
	elif ran_drink == 39:
		flavour = "Flat White"
	elif ran_drink == 40:
		flavour = " Hazelnut Latte"
	elif ran_drink == 41:
		flavour = "Aqua Hazelnut Latte"
	elif ran_drink == 42:
		flavour = "Double Caramel Latte"
	elif ran_drink == 43:
		flavour = "Caramel Evaporated Coffee"
	elif ran_drink == 44:
		flavour = "Caramel Condensed Coffee"
	elif ran_drink == 45:
		flavour = "Vanilla Chocolate Aqua Fusion"
	elif ran_drink == 46:
		flavour = "Cream Foam Mocha"
	elif ran_drink == 47:
		flavour = "Matcha Cocoa Fusion"
	elif ran_drink == 48:
		flavour = "Double Hazelnut Latte"
	elif ran_drink == 49:
		flavour = "Hazelnut Evaporated Coffee"
	elif ran_drink == 50:
		flavour = "Hazelnut Condensed Coffee"
	elif ran_drink == 51:
		flavour = "Caramel Cinnamon Thick Coffee"
	elif ran_drink == 52:
		flavour = "Evaporated Chocolate Fusion"
	elif ran_drink == 53:
		flavour = "Deluxe Caramel Mocha"
	elif ran_drink == 54:
		flavour = "The Ultimate Aqua Espresso"
	elif ran_drink == 55:
		flavour = "Condensed Matcha Coffee"
	elif ran_drink == 56:
		flavour = "Cream Hazelnut Cocoa"
	elif ran_drink == 57:
		flavour = "Double Cinnamon Mocha"
	elif ran_drink == 58:
		flavour = "Smooth Foam Iced Frappe "
	elif ran_drink == 59:
		flavour = "Polar Blue Iced Americano"
	elif ran_drink == 60:
		flavour = "Lava Winter Hot Mocha"
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







	
