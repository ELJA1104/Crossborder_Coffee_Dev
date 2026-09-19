extends Node2D
@onready var anim_player: AnimationPlayer = $AnimationPlayer

func _ready():
	anim_player.play("menu")

func _on_btn_quit_pressed() -> void:
	get_tree().quit()
