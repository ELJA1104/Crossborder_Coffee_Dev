class_name Enemy
extends CharacterBody2D

var target : Player

@export var start_y: float = 0
@export var max_forward_y: float = 650
@export var min_scale: float = 1
@export var max_scale: float = 8


var SPEED = 75


func _ready():
	pass
	
func _set_multi_scale():
	pass
	
	
func _physics_process(delta: float) -> void:
	if target:
		var direction = (target.position - position).normalized()
		velocity = direction * SPEED
	move_and_slide()
	
	global_position.y += 100 * delta
	var total_distance = max_forward_y - start_y
	var curr_distance = global_position.y - start_y
	var travel_percentage = curr_distance / total_distance
	var target_scale = lerp(min_scale, max_scale, travel_percentage)
	var final_scale = clamp(target_scale, min_scale, max_scale)
	
	scale = Vector2(final_scale, final_scale)
	
func _kill_enemy():
	queue_free()
	
func _on_area_2d_area_entered(body):
	if "cursor" in body.name:
		_kill_enemy()
		
