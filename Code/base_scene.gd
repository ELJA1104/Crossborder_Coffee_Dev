extends Node2D
@export var anim_plyr : AnimationPlayer
var cocoa_powder_pressed : bool = false
var matcha_powder_pressed : bool = false
var cinnamon_powder_pressed : bool = false
#PLEASE READ!!!
#THIS SCENE IS USED AS A BASIS FOR OTHER SCENES TO BE TESTED HERE!!! IMPORT YOUR SCENE INTO THIS SCENE TO RUN AND TEST IT FOR BUGS
#这个Scene作为在此处测试其他Scene的基础！！！请将您的场景导入此场景，以便运行并测试是否存在错误。

func _on_cocoa_powder_pressed() -> void:
	if cocoa_powder_pressed == false:
		anim_plyr.play("Cocoa Powder slide in")
		cocoa_powder_pressed = true
	elif cocoa_powder_pressed == true:
		anim_plyr.play("Cocoa Powder slide out")
		cocoa_powder_pressed = false

func _on_matcha_powder_pressed() -> void:
	if matcha_powder_pressed == false:
		anim_plyr.play("Matcha Powder slide in")
		matcha_powder_pressed = true
		
	elif matcha_powder_pressed == true:
		anim_plyr.play("Matcha Powder slide out")
		matcha_powder_pressed = false

func _on_cinnamon_powder_pressed() -> void:
	if cinnamon_powder_pressed == false:
		anim_plyr.play("Cinnamon Powder slide in")
		cinnamon_powder_pressed = true
		
	elif cinnamon_powder_pressed == true:
		anim_plyr.play("Cinnamon Powder slide out")
		cinnamon_powder_pressed = false


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	pass # Replace with function body.
