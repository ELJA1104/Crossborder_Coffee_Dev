extends Control

@onready var label = $Label
var pressed :bool = false

func _ready() -> void:
	pressed = false
	$Label.text = "Full Screen"
	_on_button_pressed()

func renew():
	if pressed == true:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
		DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, false)
		$Label.text = "Full Screen"
	else: 
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, false)
		$Label.text = "Windowed"

func _on_button_pressed() -> void:
	if pressed == true:
		pressed = false
	else:
		pressed = true
	renew()


func _on_button_2_pressed() -> void:
	if pressed == true:
		pressed = false
	else:
		pressed = true
	renew()
