extends Node2D

@export var player : Player

const WIDTH = 1300
const HEIGHT = 150
const ENEMY = preload("res://Scenes/Enemy.tscn")

var spawnArea = Rect2()

#Spawn time management
var delta = 1
var offset = 4


func _ready() -> void:
	randomize()
	spawnArea = Rect2(0, 0, WIDTH, HEIGHT)
	_set_next_spawn()
	
func _spawn_enemy():
	var position = Vector2(randi()%WIDTH, randi()%HEIGHT)
	
	var enemy = ENEMY.instantiate()
	enemy.target = player
	enemy.position = position
	get_parent().add_child(enemy)
	
	return position
	
	
func _set_next_spawn():
	var nextTime = delta + (randf() - 0.5)*2*offset
	$Timer.wait_time = nextTime
	$Timer.start()
	

func _on_timer_timeout() -> void:
	_spawn_enemy()
	_set_next_spawn()
	
	
#func _draw():
	#var radius = 15
	#draw_rect(spawnArea, Color(0.375, 0.375, 0.375, 0.0))
	#
	#for i in range(20):
		#draw_circle(_spawn_enemy(), radius, Color.TRANSPARENT)
		#
