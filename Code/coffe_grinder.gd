extends Node2D


var time:int = 60
#bool===========================================================================

var done : bool = false
var puck_entered :bool = false
var grinder_closing_act : bool = true
var coffee_entered :bool = false
var two :bool = false
var can_ext:bool = false
var can :bool=false
#===============================================================================

var puck
#onready========================================================================

@onready var ext :Button = $Button2
@onready var button:Button = $Button
@onready var label :Label = $Label
@onready var grinder_open =$Grinder2
@onready var grinder_close =$Grinder1
#func ==========================================================================

func _ready() -> void:
	$Grinder2/opening_button.modulate.a = 0
	$Grinder1/closing_button.modulate.a = 0
	grinder_closing_act = true
	grinder_close.show()
	grinder_open.hide()
	label.visible_characters = 0
	label.text = "Not started yet"
	for i in range(0,16):
		label.visible_characters += 1
		await get_tree().create_timer(0.05).timeout


func a():
	label.text = "Not started yet"
	for i in range(0,16):
		label.visible_characters += 1
		await get_tree().create_timer(0.05).timeout


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("coffee bean"):
		coffee_entered = true
		if grinder_closing_act ==true:
			label.visible_characters = 0
			label.text = "Please close the
grinder"
			for i in range(0,100):
				label.visible_characters += 1
				await get_tree().create_timer(0.05).timeout
		else:
			a()


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.is_in_group("coffee bean"):
		coffee_entered = false
		a()
	if can:
		can = false


func _on_button_pressed() -> void:
	if coffee_entered and two and can:
		grinder_close = false
		await get_tree().create_timer(0.1).timeout
		only_congrat()
		done = true


func reset_two():
	two = false


func only_congrat():
	label.visible_characters = 0
	label.text = "Done。"
	for i in range(0,10):
		label.visible_characters += 1
		await get_tree().create_timer(0.05).timeout


func _on_closing_button_pressed() -> void:
	grinder_closing_act = true
	grinder_close.hide()
	grinder_open.show()


func _on_opening_button_pressed() -> void:
	grinder_close.show()
	grinder_open.hide()
	if grinder_closing_act and coffee_entered:
		two = true
		can = true
		label.visible_characters = 0
		label.text = "Please press the
 'Grind' button"
		for i in range(0,100):
			label.visible_characters += 1
			await get_tree().create_timer(0.05).timeout


func _on_extract_area_body_entered(body:CharacterBody2D) -> void:
	if body is Ethan_Puck:
		puck = Ethan_Puck
		puck_entered = true


func _on_extract_area_body_exited(body:CharacterBody2D) -> void:
	if body is Ethan_Puck:
		puck = null


func _on_button_2_pressed() -> void:
	if puck_entered and done:
		if puck: 
			puck.is_empty = false
		else:
			puck.is_empty = true
