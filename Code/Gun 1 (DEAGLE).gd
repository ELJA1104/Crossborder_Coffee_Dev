extends Control
var price = 35000
@onready var parent_node = get_tree().root
var can_buy : bool

func _ready() -> void:
	pass
	#print(parent_node)

func _on_purchase_button_pressed() -> void:
	if price > Noel_sEvent.current_credit_balance:
		can_buy = false
		print(can_buy)
	elif price < Noel_sEvent.current_credit_balance:
		can_buy = true
