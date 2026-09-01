extends Node2D
@onready var Text_label = find_child("RichTextLabel", true, false) 
var is_done_typing : bool = false
var click_count : int = 0
var space_deleted : bool = false
var is_line_1_locked : bool = false  
var strike_count : int = 0           
var waiting_for_click : bool = false  
var can_skip : bool = true

func _ready():
	Text_label.move_to_front() 
	$Sprite2D/AnimationPlayer.play("开场进来")
	await get_tree().create_timer(1.5).timeout 
	Text_label.bbcode_enabled = true 
	play_whole_game_story()

func play_whole_game_story():
	is_line_1_locked = true  
	Text_label.text = "[shake rate=40 level=20][color=red]WAKE UP! WAKE UP! WAKE UP!!! YOU ABSOLUTE SLEEPING BEAUTY!!![/color][/shake]"
	Text_label.visible_characters = 0
	var line_1_length = Text_label.get_parsed_text().length()
	for blablabla in range(line_1_length):
		Text_label.visible_characters += 1
		await get_tree().create_timer(0.015).timeout
	await get_tree().create_timer(5.0).timeout 
	is_line_1_locked = false 
	await play_line("[shake rate=30 level=12]Don't you know how to press the [color=orange][b]SPACEBAR[/b][/color]?! That main biggest key on your keyboard!!! OMG what are you?! Do I seriously have to teach you that too?!!![/shake]")
	await play_line("I am in a massive hurry here! If it wasn't for 'that person' (the Author), I wouldn't be wasting my glorious time and life on you!!!")
	await play_line("[shake rate=25 level=10][color=red]ARE YOU DEAD?! TELL ME YOU'RE NOT DEAD! BECAUSE IF YOU DON'T OPEN YOUR EYES RIGHT THIS SECOND...[/color][/shake]")
	await play_line("[shake rate=35 level=15][color=orange]THOSE FREAKS IN LEATHER LOAFERS WILL SMASH THAT DOOR AND TURN US BOTH INTO HISTORY!!![/color][/shake]")
	await play_line("THE WORLD OUT THERE IS [font_size=42][color=red][b]100% COOKED!!![/b][/color][/font_size]")
	await play_line("[i]...UMM, WELL, ACTUALLY, MAYBE NOT 100% COOKED, BECAUSE HELLO?I'm running a [color=yellow][b]COFFEE SHOP[/b][/color] here![/i]")
	await play_line("If it's all zombies, how am I supposed to play this game?! I AM THE BOSS OF THIS CAFÉ!!")
	await play_line("AND I JUST SAVED YOUR MISERABLE LIFE!!! SHOW SOME RESPECT!!!")
	await play_line("WE ARE GOING TO BE OVERRUN BY THAT BIZARRE ANOMALY!!! THE [color=pink][b]'JK VIRUS'!!![/b][/color]")
	await play_line("WHATEVER BASEMENT-DWELLING MAD SCIENTIST CREATED IT WAS A COMPLETE, HOPELESS SPECIMEN OF AN [font_size=36][b]OTAKU!!![/b][/font_size]")
	await play_line("EVERY SINGLE LIVING THING OUT THERE IS FORCED TO WEAR A [color=pink]PLEATED PINK SAILOR SKIRT!!![/color]")
	await play_line("AND LACE THIGH-HIGH STOCKINGS! MARCHING AROUND AND SCREAMING [font_size=38][color=pink]'ONII-CHAN!'[/color][/font_size] IT'S A LITERAL NIGHTMARE!!!")
	can_skip = false
	await play_line("[color=cyan]LISTEN CAREFULLY! I'M ONLY TEACHING YOU ONCE! COFFEE BEANS INTO THE GRINDER!!![/color]
	[color=cyan]FILTER PACK INTO THE BREWER!!! CUP UNDERNEATH IT!!! THAT'S IT!!![/color]", true, 1.5)
	await play_line("[shake rate=30 level=12][font_size=36][color=orange]WHAT?! YOU'RE COMPLAINING THAT I TALK TOO FAST?! THAT'S YOUR OWN DAMN FAULT FOR HAVING SLOW EARS, YOU LOSER!!![/color][/font_size][/shake]", true, 2)
	can_skip = true
	await play_line("HELLO?! I JUST SAVED YOUR MISERABLE ALIEN SOUL!!! YOU OWE ME YOUR LIFE, UNDERSTOOD?!!!")
	await play_line("[shake rate=30 level=15][color=red]SO YOU FOLLOW MY ORDERS 100%! ABSOLUTELY NO COMPLAINTS! IF YOU DARE TO REBEL OR ARGUE EVEN A TINY BIT, I SWEAR I WILL BEEP-BEEP-BEEP YOU TO DEATH!!![/color][/shake]")
	await play_line("DID YOU HEAR ME?! IF YOU DIDN'T, THAT'S YOUR BUSINESS! HAS NOTHING TO DO WITH ME!!!")
	await play_line("THERE ARE PLENTY OF MATERIALS IN THE SHOP! LOOK AT THEM YOURSELF!!!")
	await play_line("[font_size=20][color=gray]...After all, I just opened this place an hour ago specifically to scam players and survivors—[/color][/font_size]")
	await play_line("[shake rate=45 level=25][color=red][b]DCVWUEKLDEWGDHEWILD!!![/b][/color][/shake] AH! FORGET WHAT I JUST SAID! I'M LEAVING! YOU'RE ON YOUR OWN!!!")
	await play_line("[shake rate=40 level=20][color=red][font_size=45][b]WAIT!!! THEY ARE SMASHING THE WINDOWS!!! THE ZOMBIES AND CUSTOMERS ARE HERE!!![/b][/font_size][/color][/shake]")
	await play_line("[shake rate=35 level=15][color=orange]IT'S ALL YOUR FAULT!!! YOUR SNORING WAS TOO LOUD!!! YES! YOU! YOUR PRECIOUS LITTLE SNORE IN YOUR SLEEP BROUGHT THEM HERE!!![/color][/shake]")
	await play_line("[color=pink]...Or... wait... maybe it's because [b]I'M JUST TOO DAMN HANDSOME?![/b] Yes! My glowing face attracted them! Damn my perfect genes!!![/color]")
	await play_line("[font_size=22][i]Plus, I am a highly responsible, incredibly busy hero! I don't have time to stay here, I have to rush off right now to save and take care of other survivors! Yes, completely true, totally not making this up to run away![/i][/font_size]")
	await play_line("[shake rate=50 level=35][color=red][font_size=48][b]ANYWAY I DON'T CARE!!! BREW THE COFFEE RIGHT NOW TO SAVE ME!!! AHHHH!!! I'M OUTTA HERE!!![/b][/font_size][/color][/shake]")
	Text_label.text = ""
	print("done！")

func play_line(text_content: String, auto_advance: bool = false, auto_time: float = 2.0):
	var loop_this_line = true
	while loop_this_line:
		click_count = 0             
		Text_label.text = text_content
		Text_label.visible_characters = 0
		is_done_typing = false
		var current_line_length = Text_label.get_parsed_text().length()
		if current_line_length == 0: current_line_length = 1
		for blablabla in range(current_line_length):
			if is_done_typing == true:
				break               
			Text_label.visible_characters += 1
			await get_tree().create_timer(0.015).timeout 
		if is_done_typing == true and click_count >= 3:
			strike_count += 1       
			if strike_count == 1:
				Text_label.text = "[shake rate=40 level=20][color=red]WHAT THE HELL ARE YOU DOING?! Clicking like crazy! You think this is a Pip-Pop fidget toy or what?! Stop spamming, immature user!!![/color][/shake]"
				Text_label.visible_characters = -1
				await get_tree().create_timer(4.5).timeout
				Text_label.text = "Ugh, whatever! Where was I? Oh right, let me start over! LISTEN!"
				Text_label.visible_characters = -1
				await get_tree().create_timer(4.5).timeout
				loop_this_line = true 
				continue
			elif strike_count >= 2 and space_deleted == false:
				space_deleted = true
				Text_label.text = "[shake rate=45 level=25][color=red][font_size=34]THAT IS IT!!! YOU TOOK IT TOO FAR!!! I am completely deleting your spacebar button!!! From now on, text changes every 3 seconds automatically, shut up and read!!![/font_size][/color][/shake]"
				Text_label.visible_characters = -1
				await get_tree().create_timer(5.0).timeout
				loop_this_line = true 
				continue
		Text_label.visible_characters = -1
		is_done_typing = true
		if auto_advance == true:
			await get_tree().create_timer(auto_time).timeout
			loop_this_line = false
		else:
			if space_deleted == true:
				await get_tree().create_timer(1.0).timeout
				loop_this_line = false
			else:
				waiting_for_click = true
				while waiting_for_click == true:
					await get_tree().process_frame 
				loop_this_line = false

func _input(event):
	if is_line_1_locked == true:
		return
	if space_deleted == true:
		return
	if can_skip == false:
		return
	var press_space = event is InputEventKey and event.keycode == KEY_SPACE and event.pressed
	if press_space:
		if is_done_typing == false:
			click_count += 1
			if click_count >= 3:
				is_done_typing = true 
		else:
			waiting_for_click = false
