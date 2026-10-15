extends Node2D
@export var Day_count_label : Label
@export var customers_served_label : Label
@export var credits_label : Label
@export var zombies_killed_label : Label
@export var Wall_repair_boxes_label : Label
@export var timer : Timer
var current_customer_num : int = 0
var current_zombie_num : int = 0
var current_WRB_count : int = 0
var a_day_is_over : bool = false
func _physics_process(_delta: float) -> void:
	credits_increase()
	customer_has_been_served()
	zombies_killed()
	WRB_bought()
		
	
func _ready() -> void:
	_on_timer_timeout()
	Day_count_label.text = "Day: " + str(Noel_sEvent.days_count)
	customers_served_label.text = "Customers Served: " + str(Noel_sEvent.customer_served_count)
	current_customer_num = Noel_sEvent.customer_served_count
	credits_label.text = "Credit balance: " + str(Noel_sEvent.current_credit_balance)
	Noel_sEvent.credits_earned = Noel_sEvent.current_credit_balance
	zombies_killed_label.text = "Zombies killed: " + str(Noel_sEvent.zombies_killed_count)
	Noel_sEvent.zombies_killed_count = current_zombie_num
	Wall_repair_boxes_label.text = "Wall repair boxes: " + str(Noel_sEvent.Wall_repair_box_count)
	Noel_sEvent.Wall_repair_box_count = current_WRB_count

func customer_has_been_served():
	if current_customer_num < Noel_sEvent.customer_served_count:
		customers_served_label.text = "Customers Served: " + str(Noel_sEvent.customer_served_count)
		current_customer_num = Noel_sEvent.customer_served_count
		
func credits_increase():
	if Noel_sEvent.current_credit_balance < Noel_sEvent.credits_earned:
		credits_label.text = "Credit balance: " + str(Noel_sEvent.credits_earned)
		Noel_sEvent.credits_earned = Noel_sEvent.current_credit_balance

func zombies_killed():
	if Noel_sEvent.zombies_killed_count > current_zombie_num:
		zombies_killed_label.text = "Zombies killed: " + str(Noel_sEvent.zombies_killed_count)
		Noel_sEvent.zombies_killed_count = current_zombie_num
		
func WRB_bought():
	if Noel_sEvent.Wall_repair_box_count > current_WRB_count:
		Wall_repair_boxes_label.text = "Wall repair boxes: " + str(Noel_sEvent.Wall_repair_box_count)
		Noel_sEvent.Wall_repair_box_count = current_WRB_count

func _on_timer_timeout() -> void:
	Noel_sEvent.days_count += 1
	Day_count_label.text = "Day: " + str(Noel_sEvent.days_count)
	print("hn")
