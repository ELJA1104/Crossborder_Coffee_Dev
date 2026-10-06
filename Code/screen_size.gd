extends Control

@onready var label = $Label
var windowed :bool = false


func _ready() -> void:
	windowed = false
	$Label.text = "Full Screen"
	_on_button_pressed()
	$OptionButton.visible = false

func renew():
	if windowed == true:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
		DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, false)
		$Label.text = "Full Screen"
	else: 
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, false)
		$Label.text = "Windowed"
		$OptionButton.visible = true

func _on_button_pressed() -> void:
	if windowed == true:
		windowed = false
	else:
		windowed = true
	renew()


func _on_button_2_pressed() -> void:
	if windowed == true:
		windowed = false
	else:
		windowed = true
	renew()

#dis doesnt work now(idk)
func _on_option_button_item_selected(index: int) -> void:
	if index == 0:
		ProjectSettings.set("display/window/size/viewport_width_override",1920)
		ProjectSettings.set("display/window/size/viewport_height_override",1080)
	if index == 1:
		ProjectSettings.set("display/window/size/viewport_width_override",1280)
		ProjectSettings.set("display/window/size/viewport_height_override",720)
	if index == 2:
		ProjectSettings.set("display/window/size/viewport_width_override",960)
		ProjectSettings.set("display/window/size/viewport_height_override",540)
