extends Node2D

@onready var menu = $menu
@onready var loading = $loading
@onready var game = $game
@onready var setting = $setting
@onready var shop = $shop
@onready var view = $Camera2D
@onready var anim_player: AnimationPlayer = $loading/AnimationPlayer
@onready var rickroll = $loading/VideoStreamPlayer

var page = 1
var dir
var play_anim : bool = false

func _ready() -> void:
	rickroll.modulate.a = 1
	rickroll.stream = preload("res://Smartest Rick Roll but with a different link. ( 720 X 1280 ).ogv")
	page = 1
	tp()


func _physics_process(_delta: float) -> void:
	if play_anim:
		anim_player.play("loading_animation")
	else:
		pass

func _on_btn_quit_pressed() -> void:
	get_tree().quit()

func _on_btn_start_pressed() -> void:
	page = 2
	tp()
	play_anim = true
	rickroll.play()
	await get_tree().create_timer(5).timeout
	play_anim = false
	rickroll.stop()
	page = 3
	tp()

func _on_btn_load_pressed() -> void:
	page = 2
	tp()
	play_anim = true
	rickroll.play()
	await get_tree().create_timer(5).timeout
	play_anim = false
	rickroll.stop()
	page = 4
	tp()

func _on_shop_pressed() -> void:
	page = 2
	tp()
	play_anim = true
	rickroll.play()
	await get_tree().create_timer(5).timeout
	play_anim = false
	rickroll.stop()
	page = 5
	tp()

func _on_back_pressed() -> void:
	page = 2
	tp()
	play_anim = true
	rickroll.play()
	await get_tree().create_timer(5).timeout
	play_anim = false
	rickroll.stop()
	page = 1
	tp()

func tp():
	if page == 1:
		dir = menu.global_position
		view.global_position = dir
	if page == 2:
		dir = loading.global_position
		view.global_position = dir
	if page == 3:
		dir = game.global_position
		view.global_position = dir
	if page == 4:
		dir = setting.global_position
		view.global_position = dir
	if page == 5:
		dir = shop.global_position
		view.global_position = dir

#page(1=menu),(2=loading),(3=game),(4=setting),(5=shop)
