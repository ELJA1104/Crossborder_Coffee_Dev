extends StaticBody2D

@export var max_Health: int = 100
var curr_Health: int

func _ready() -> void:
	curr_Health = max_Health

func _take_damage(amount: int):
	curr_Health -= 5
	print("GreatWall took damage! Health left: ", curr_Health)
	
	if curr_Health < 0:
		_destroy_wall()
		
func _destroy_wall():
	queue_free()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
