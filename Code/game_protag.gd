extends CharacterBody2D
const Speed = 1500
var health : int = 100
var has_finished_drink : bool = false
var is_at_counter : bool = false


func _physics_process(delta: float) -> void:
	movement()
	move_and_slide()
	
func movement():
	var direc = Input.get_vector("Left", "Right", "Up", "Down")
	velocity = direc * Speed
	
