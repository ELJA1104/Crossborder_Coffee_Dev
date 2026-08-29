extends Node2D

var speed = 1
var playing : bool = false
@onready var title : Label = $Label
@onready var playlist = [{"name" : "Undertale", "pth" : preload("res://music/Undertale.mp3")}]
@onready var player :AudioStreamPlayer2D = $player
@onready var disco :CharacterBody2D = $CharacterBody2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	title.text = playlist[0]["name"]
	player.stream = playlist[0]["pth"]
	player.play()
	playing = true
	renew()

func renew():
	title.visible_characters = 0
	await get_tree().create_timer(0.4).timeout
	for i in title.text.length():
		title.visible_characters += 1
		await get_tree().create_timer(0.05).timeout

func _process(delta: float) -> void:
	if playing:
		disco.rotate(speed * delta)
