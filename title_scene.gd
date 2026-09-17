extends Node2D

@onready var quit = $quit
@onready var nuhuh = $Label2
@onready var rickroll = $Control/VideoStreamPlayer


var icon = 0
var times = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	rickroll.modulate.a = 1
	rickroll.stream = preload("res://Smartest Rick Roll but with a different link. ( 720 X 1280 ).ogv")

func _on_quit_pressed() -> void:
	if times == 1:
		nuhuh.text = "Fine"
		for i in range(10):
			quit.modulate.a -= 0.1
			await get_tree().create_timer(0.05).timeout
		for i in range(10):
			nuhuh.modulate.a += 0.1
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

func _on_start_pressed() -> void:
	$ColorRect2.global_position = $ColorRect.global_position
	await get_tree().create_timer(1).timeout
	get_tree().change_scene_to_file("res://Scenes/change_scene.tscn")
	

func _on_icon_pressed() -> void:
	var lgth = $Sprite2D/Label.text.length()
	icon += 1
	if icon == 9:
		$Sprite2D/Label.text = "Don't touch me"
	$Sprite2D/Label.visible_characters = 0
	for i in range(lgth):
		$Sprite2D/Label.visible_characters += 1
		await get_tree().create_timer(0.05).timeout
	print(icon)
