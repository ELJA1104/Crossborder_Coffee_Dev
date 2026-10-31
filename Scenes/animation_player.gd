extends AnimationPlayer


func _ready() -> void:
	speed_scale = 2
	play("Tutorial")

func _process(delta: float) -> void:
	pass

func _on_animation_finished(anim_name: StringName) -> void:
	pass 
