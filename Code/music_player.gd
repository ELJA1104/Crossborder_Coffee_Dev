extends Node2D


var speed = 1
var playing : bool = false
var can_play :bool = true
@onready var title : Label = $Label
@onready var author : Label = $Label2
var playlist_original = [{"name" : "Undertale", "pth" : preload("res://music/Undertale.mp3"), "author": "Tobyfox"}
,{"name":"Just You","pth" : preload("res://music/Just You.mp3"), "author":"Fotainebleau"}
,{"name" : "Waterdrop", "pth" : preload("res://music/Waterdrop.mp3"), "author" :"Fotainebleau"}
]
var playlist = []
@onready var player :AudioStreamPlayer2D = $player
@onready var disco :CharacterBody2D = $CharacterBody2D

func _ready() -> void:
	playlist = playlist_original.duplicate()
	var current = randi() % playlist.size()
	play_music(current)

func play_music(current):
	player.stream = playlist[current]["pth"]
	title.text = playlist[current]["name"]
	author.text = playlist[current]["author"]
	player.play()
	playing = true
	renew_title()
	renew_author()
	playlist.remove_at(current)
	if playlist.is_empty():
		_ready()

func renew_title():
	title.visible_characters = 0
	await get_tree().create_timer(0.4).timeout
	for i in title.text.length():
		title.visible_characters += 1
		await get_tree().create_timer(0.05).timeout

func renew_author():
	author.visible_characters = 0
	await get_tree().create_timer(0.4).timeout
	for i in author.text.length():
		author.visible_characters += 1
		await get_tree().create_timer(0.05).timeout

func _process(delta: float) -> void:
	if playing:
		disco.rotate(speed * delta)

func _on_stop_pressed() -> void:
	if can_play:
		can_play = false
		player.stream_paused = true
		playing = false
	elif can_play == false:
		can_play=true
		player.stream_paused = false
		playing = true


func _on_player_finished() -> void:
	_ready()


func _on_shuffle_pressed() -> void:
	_on_player_finished()
