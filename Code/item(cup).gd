extends CharacterBody2D
class_name Cup_node
var ice_cube
var milk
var sugar
var milk_foam
var cocoa_powder
var chocolate_sauce
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
func _on_area_2d_body_entered(body):
	can_add_things = true
	Progress_Bar_cup.show()
	print(body.name)
	if nothing_loading:
		if body is Ice_cube_node:
			ice_cube = body
			_ingredians = 1
		if body is Milk_node:
			milk = body
			_ingredians = 2
		if body is Sugar_node:
			sugar = body
			_ingredians = 3
		if body is Milk_foam_node:
			milk_foam = body
			_ingredians = 4
		if body is Cocoa_powder_node:
			cocoa_powder = body
			_ingredians = 5
		if body is Chocolate_sauce_node:
			chocolate_sauce = body
			_ingredians = 6

func _on_area_2d_body_exited(body):
	can_add_things = false
	Progress_Bar_cup.hide()
	Progress_Bar_cup.value = 0
	print(body.name + 'is go out')

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
var ingredians_cinnamon = 0

func drink_select():
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







	
