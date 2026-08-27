extends CharacterBody2D
class_name Milk_node
var when_is_grab_milk : bool = false

func _ready():
	input_pickable = true
	input_event.connect(_on_input_event)
	$"../spwaner(milk)/Area2D".body_entered.connect(_on_area_2d_body_entered)

func _process(_delta):
	if when_is_grab_milk:
		global_position = lerp(global_position, get_global_mouse_position(), 0.2)
		if not Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
			_on_release_ingredient()

func _on_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			when_is_grab_milk = true
			get_viewport().set_input_as_handled() 
			piking = true

func _on_release_ingredient():
	when_is_grab_milk = false
	move_to_front() 
	tp_to_spwaner()

func tp_to_spwaner():
	if $"../spwaner(milk)":
		when_is_grab_milk = false
		global_position = $"../spwaner(milk)".global_position
		piking = false
		Text_label.visible_characters = 0
		ui = ""
		text_to_be_displayed(ui)

func _on_area_2d_body_entered(body):
	if body is Cup_node:
		body.cup_is_in_spwaner()

@onready var Text_label = $Label
var ui : String
var piking : bool = false

func displaying_text():
	Text_label.visible_characters = 0
	for i in range(Text_label.text.length()):
		Text_label.visible_characters += 1
		await get_tree().create_timer(0.03).timeout

func text_to_be_displayed(text : String):
	Text_label.text = text
	displaying_text()

func _on_mouse_entered():
	if piking == false :
		ui = "Milk"
		text_to_be_displayed(ui)

func _on_mouse_exited():
	if piking == false :
		Text_label.visible_characters = 0
		ui = ""
		text_to_be_displayed(ui)
