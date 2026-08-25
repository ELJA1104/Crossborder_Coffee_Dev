extends Node2D
@export var bullet_spawn : Node2D
@export var barrel_end : Node2D
#var bullet_scn = preload("res://Scenes/45_acp_projectile.tscn")

#var casing_scn = preload("res://Scenes/45_acp_casing.tscn")

var bullet_speed : int = randf_range(5, 6)
	
func recieve_input():
	if Input.is_action_just_pressed("fire"):
#		shooting()
#		casing_ejection()
		print("jn")

func _physics_process(delta: float) -> void:
	recieve_input()
"	
func shooting():
	var bullet : RigidBody2D = bullet_scn.instantiate()
	get_tree().root.add_child(bullet)
	bullet.global_position = bullet_spawn.global_position
	bullet.global_rotation = self.global_rotation
	bullet.linear_velocity = (barrel_end.global_position - bullet_spawn.global_position) * bullet_speed
	#linear_velocity = (to location from location) * speed
	
func casing_ejection():
	var casing : RigidBody2D = casing_scn.instantiate()
	get_tree().root.add_child(casing)
	casing.global_position = Vector2.ZERO
	casing.angular_velocity += randf_range(-360,3600)
	casing.linear_velocity = (Vector2.DOWN - Vector2.ZERO) * randf_range(10, 27)
"
