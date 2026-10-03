extends Node2D
@export var anim_plyr : AnimationPlayer
@export var ran_txt_label : Label
@export var info_txt_label : Label
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
			
func num_def(selection_num):

	if selection_num == 1:
		Noel_sEvent.Coffee_Bean_Hack_enabled = true
		ran_txt_label.text = "Coffee Bean Buff"
		info_txt_label.text = "Damage +4"
	elif  selection_num == 2:
		Noel_sEvent.Milk_Hack_enabled = true
		ran_txt_label.text = "Milk Buff"
		info_txt_label.text = "Gun fire rate +10%"
	elif selection_num == 3:
		Noel_sEvent.Milk_Cream_Hack_enabled = true
		ran_txt_label.text = "Milk Cream Buff"
		info_txt_label.text = "Zombie speed -10%"
	elif selection_num == 4:
		Noel_sEvent.Ice_Hack_enabled = true
		ran_txt_label.text = "Ice Buff"
		info_txt_label.text = "Zombie freeze rate +5%"
	elif selection_num == 5:
		Noel_sEvent.Cocoa_Hack_enabled = true
		ran_txt_label.text = "Cocoa Powder Buff"
		info_txt_label.text = "Time +10s"
	elif selection_num == 6:
		Noel_sEvent.Cinnamon_Hack_enabled = true
		ran_txt_label.text = "Cinnamon Powder Buff"
		info_txt_label.text = "Area damage radius / 4"
	elif selection_num == 7:
		Noel_sEvent.Matcha_Hack_enabled = true
		ran_txt_label.text = "Matcha Power Buff"
		info_txt_label.text = "Add Toxic"
	elif selection_num == 8:
		Noel_sEvent.Sugar_Hack_enabled = true
		ran_txt_label.text = "Sugar Buff"
		info_txt_label.text = "On Zombie death, a bomb will be there"
func _on_button_pressed() -> void:
	if opened == false:
		pass
	elif opened == true:
		var a = 1
		for i in range (1000):
			ran_txt_label.text = str(a)
			await get_tree().create_timer(.001).timeout
			a = randi_range(1,8)
		num_def(a)


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "door opening animation":
		opened = true
