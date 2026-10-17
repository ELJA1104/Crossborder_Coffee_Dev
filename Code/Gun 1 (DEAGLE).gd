extends Control
var price = 35000
@onready var parent_node : Node
func _ready() -> void:
	if owner:
		parent_node = owner

func _on_purchase_button_pressed() -> void:
	if price > Noel_sEvent.current_credit_balance:
		parent_node.purchase_text(false)
		print(Noel_sEvent.current_credit_balance)
	elif price <= Noel_sEvent.current_credit_balance:
		parent_node.purchase_text(true)
		Noel_sEvent.current_credit_balance -= price
