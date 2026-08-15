extends Node2D

@onready var player :CharacterBody2D = $player
@onready var shop = $shop
@onready var pvz = $pvz

func _ready() -> void:
	player.global_position = pvz.global_position
