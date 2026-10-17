class_name healthBar
extends ProgressBar

@export var GreatWall : GreatWall

func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("m1"):
		take_damage(10)

func set_health_bar(currValue, maxValue):
	maxValue = maxValue
	value = currValue
	
func take_damage(damage):
	value -= damage
	
	if value < 0:
		value = 0

func _ready() -> void:
	set_health_bar(1000, 1000)
	
func _process(delta: float) -> void:
	pass
