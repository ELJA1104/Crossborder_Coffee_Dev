extends Node2D

@onready var quit = $quit
@onready var nuhuh = $Label2
@onready var rickroll = $Control/VideoStreamPlayer
@onready var player = $AnimationPlayer

var times = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	rickroll.modulate.a = 1
	rickroll.stream = preload("res://Smartest Rick Roll but with a different link. ( 720 X 1280 ).ogv")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_quit_pressed() -> void:
	if times == 2:
		nuhuh.text = "Fine"
		nuhuh.modulate.a = 1
		await get_tree().create_timer(1).timeout
		get_tree().quit()
	for i in range(10):
		quit.modulate.a -= 0.1
		await get_tree().create_timer(0.05).timeout
	await  get_tree().create_timer(0.1).timeout
	for i in range(10):
		nuhuh.modulate.a += 0.1
		await get_tree().create_timer(0.05).timeout
	for i in range(10):
		rickroll.modulate.a += 0.1
		await get_tree().create_timer(0.05).timeout
	rickroll.play()
	await get_tree().create_timer(7).timeout
	rickroll.stop()
	rickroll.modulate.a = 0
	nuhuh.modulate.a = 0
	quit.modulate.a = 1
	times += 1



func _on_setting_pressed() -> void:
	player.play("new_animation")
