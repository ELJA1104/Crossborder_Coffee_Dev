extends Node2D
@export var node2d : Node2D
@export var anim_plyr : AnimationPlayer
var mouse_in_DEagle : bool = false
var DEagle_price : int = 35000
var Wall_repair_box_price : int = 10000
var Secret_hack_price : int = 10000
var opened : bool = false
func _on_test_mouse_entered() -> void:
	mouse_in_DEagle = true
func _on_test_mouse_exited() -> void:
	mouse_in_DEagle = false
func  _ready() -> void:
	pass
	
func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("m1"):
		if mouse_in_DEagle == true:
			if DEagle_price > Noel_sEvent.current_credit_balance:
				print("Not enough Credits")
			elif DEagle_price <= Noel_sEvent.current_credit_balance:
				print("Suffecient credits")

func _on_wall_repair_button_pressed() -> void:
	if Wall_repair_box_price > Noel_sEvent.current_credit_balance:
		print("Not enough Credits")
	elif Wall_repair_box_price <= Noel_sEvent.current_credit_balance:
		print("Suffecient Credits")

func _on_secret_hack_buy_button_pressed() -> void:

	if Secret_hack_price > Noel_sEvent.current_credit_balance:
		print("Not enough Credits")
	#elif Secret_hack_price <= Noel_sEvent.current_credit_balance:
		print("Suffecient Credits")
		if opened == false:
			anim_plyr.play("door opening animation")
		elif opened == true:
			pass

func _on_coffee_bean_hack_pressed() -> void:
	Noel_sEvent.Coffee_Bean_Hack_enabled = true

func _on_milk_hack_pressed() -> void:
	Noel_sEvent.Milk_Hack_enabled = true

func _on_sugar_hack_pressed() -> void:
	Noel_sEvent.Sugar_Hack_enabled = true

func _on_milk_cream_hack_pressed() -> void:
	Noel_sEvent.Milk_Cream_Hack_enabled = true

func _on_ice_hack_pressed() -> void:
	Noel_sEvent.Ice_Hack_enabled = true

func _on_cocoa_hack_pressed() -> void:
	Noel_sEvent.Cocoa_Hack_enabled = true

func _on_matcha_hack_pressed() -> void:
	Noel_sEvent.Matcha_Hack_enabled = true

func _on_cinnamon_hack_pressed() -> void:
	Noel_sEvent.Cinnamon_Hack_enabled = true

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "door opening animation":
		opened = true
