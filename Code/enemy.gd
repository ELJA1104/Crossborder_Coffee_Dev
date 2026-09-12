class_name Enemy
extends CharacterBody2D


var target : Player


var SPEED = 100

func _ready():
	pass
	
	
func _physics_process(delta: float) -> void:
	if target:
		var direction = (target.position - position).normalized()
		velocity = direction * SPEED
	move_and_slide()
	
	

func _kill_enemy():
	queue_free()
	
func _on_area_2d_area_entered(body):
	if "cursor" in body.name:
		_kill_enemy()
		
