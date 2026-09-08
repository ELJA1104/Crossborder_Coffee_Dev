extends Node2D
@export var anim_plyr : AnimationPlayer
var button_pressed_once : bool = false



#PLEASE READ!!!
#THIS SCENE IS USED AS A BASIS FOR OTHER SCENES TO BE TESTED HERE!!! IMPORT YOUR SCENE INTO THIS SCENE TO RUN AND TEST IT FOR BUGS
#这个Scene作为在此处测试其他Scene的基础！！！请将您的场景导入此场景，以便运行并测试是否存在错误。


func _on_button_pressed() -> void:
	if button_pressed_once == false:
		anim_plyr.play("Main ingredients slide in")
		#anim_plyr.play("Cocoa Powder slide in")
		#anim_plyr.play("Matcha Powder slide in")
		#anim_plyr.play("Cinnamon Powder slide in")
		button_pressed_once = true
		
	elif button_pressed_once == true:
		anim_plyr.play("Main ingredients slide out")
		#anim_plyr.play("Cocoa Powder slide out")
		#anim_plyr.play("Matcha Powder slide out")
		#anim_plyr.play("Cinnamon Powder slide out")
		button_pressed_once = false
