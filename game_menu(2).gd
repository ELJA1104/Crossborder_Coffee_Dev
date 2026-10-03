extends Node2D
@onready var anim_player: AnimationPlayer = $AnimationPlayer
var shop 
func _ready():
	anim_player.play("给vernon：换成你的")

func _on_btn_quit_pressed() -> void:
	get_tree().quit()

func _on_shop_pressed() -> void:
	$shop_page.in_shop()
