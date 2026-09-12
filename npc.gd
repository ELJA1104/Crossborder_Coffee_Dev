extends Node2D
@onready var anim_player: AnimationPlayer = $AnimationPlayer
@onready var dialog_text: RichTextLabel = $text

func _ready():
	dialog_text.bbcode_enabled = true 
	dialog_text.visible_ratio = 0.0
	run_story_sequence()

func run_story_sequence():
	if anim_player.has_animation("intro"):
		anim_player.play("intro")

	await display_line("[center][color=gray](Wake up... wake up...)[/color][/center]", 1.0)
	await get_tree().create_timer(1.0).timeout
	await display_line("[center]Whoa! You're finally awake! Let me introduce myself, I'm the Pioneer here.[/center]", 2.0)
	await get_tree().create_timer(1.5).timeout
	await display_line("[center]Honestly, you just fell out of the sky out of nowhere, and you're not dead! It's a miracle![/center]", 2.0)
	await get_tree().create_timer(1.0).timeout
	await display_line("[center]You're asking what I do? Well... I have no idea! Because it's the [color=red][shake rate=20 level=10]APOCALYPSE[/shake][/color] right now!!![/center]", 2.5)
	await get_tree().create_timer(1.2).timeout
	await display_line("[center]Everything outside is full of 'creepy monsters.' I dare not look, it will pollute my eyes![/center]", 2.0)
	await get_tree().create_timer(1.0).timeout
	await display_line("[center]So what should we do now? Since there are two of us, let's brew coffee! It will definitely make lots of money![/center]", 2.2)
	await get_tree().create_timer(1.0).timeout
	await display_line("[center]You ask who will buy it during the apocalypse? Ha! Am I not a human?! [/center]", 2.0)
	await get_tree().create_timer(1.0).timeout
	await display_line("[center]When other survivors are struggling out there and see a cozy coffee shop, they will definitely pay... right?[/center]", 2.0)
	await get_tree().create_timer(1.0).timeout
	anim_player.play("do coffee")
	await display_line("[center]You ask me how to make it and what to use? Look! The machines are all ready![/center]", 2.0)
	await get_tree().create_timer(1.0).timeout
	anim_player.play("do coffee2")
	await display_line("[center]Listen closely: Put the [color=yellow]coffee beans on top[/color] of [b]Machine 1[/b], place a [color=aqua]pack underneath[/color], and press the button![/center]", 2.5)
	await get_tree().create_timer(1.0).timeout
	await display_line("[center]Then take that pack, put it into [b]Machine 2[/b], place a cup at the bottom, and press the button again![/center]", 2.5)
	await get_tree().create_timer(1.0).timeout
	await display_line("[center]There are plenty of ingredients here for you to mix! Good luck... I'm outta here![/center]", 2.0)
	await get_tree().create_timer(0.5).timeout
	anim_player.play("ending")
	display_line("[center][b][color=yellow]..........[/color][/b][/center]", 0.1)

func display_line(new_text: String, duration: float) -> Signal:
	dialog_text.text = new_text
	dialog_text.visible_ratio = 0.0 
	var text_tween = create_tween()
	text_tween.tween_property(dialog_text, "visible_ratio", 1.0, duration)
	return text_tween.finished
