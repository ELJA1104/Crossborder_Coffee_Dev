class_name GreatWall
extends Area2D

var health = 1500
var wall_intact = true
var enemy_in_atk_range = false
var enemy_atk_cooldown = true

func _physics_process(delta):
	enemy_atk()
	update_health()
	
	if health <= 0:
		wall_intact = false
		health = 0
		print("Wall has been destroyed!")
		self.queue_free()
		
func enemy_atk():
	if enemy_in_atk_range and enemy_atk_cooldown == true:
		health = health - 4
		enemy_atk_cooldown = true
		$atk_cooldown.start()
		print(health)

func update_health():
	var healthBar = $HealthBar
	
	healthBar.value = health
	
	if health >= 1500:
		healthBar.visible = false
	else:
		healthBar.visible = true
	
func _on_hurt_box_body_entered(body: Node2D) -> void:
	if body.has_method("enemy"):
		enemy_in_atk_range = true
	
	
func _on_hurt_box_body_exited(body: Node2D) -> void:
	if body.has_method("enemy"):
		enemy_in_atk_range = false
	
	
func _on_timer_timeout() -> void:
	if health < 1500:
		health = health + 2
		if health > 1500:
			health = 1500
	if health <= 0:
		health = 0
	
func _on_atk_cooldown_timeout() -> void:
	enemy_atk_cooldown = true
