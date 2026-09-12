extends Node2D
class_name  Customer_Spawner
@export var spwn_node : Node2D
@export var Day_count_label : Label
@export var  customers_served_label : Label
@export var credits_label : Label
var customer_scene
var customer
var customer_spawn_rate = randi_range(150, 300)
var days_count : int = 0
var day_duration : int = 2500
var customer_served_count : int = 0
var current_num : int = 0
var current_credit_balance : int = 0
var credits_earned : int = 0

func _ready() -> void:
	spawn_customer()
	child_spawn_timer()
	
func _physics_process(delta: float) -> void:
	customer_has_been_served()
	day_time()
	credits_increase()
	
func spawn_customer():
	if customer_spawn_rate + 120 > day_duration:
		pass
	else:
		customer_scene = preload("res://Scenes/customers.tscn")
		customer = customer_scene.instantiate()
		customer.customer_spawner = self
		print(customer.customer_spawner)
		spwn_node.add_child(customer)
		customer.anim_plyr.play("customer_sld_in")
		

func child_spawn_timer():
	await get_tree().create_timer(customer_spawn_rate).timeout
	spawn_customer()
	
func day_time():
	for i in range (day_duration):
		if day_duration >= 1:
			await get_tree().create_timer(1).timeout
			day_duration -= 1
		elif day_duration == 0:
			day_duration = 2500
			days_count + 1
			Day_count_label.text = "Day: " + str(days_count)
			
func customer_has_been_served():
	if current_num < customer_served_count:
		customers_served_label.text = "Customers Served: " + str(customer_served_count)
		current_num = customer_served_count
		
func credits_increase():
	if current_credit_balance < credits_earned:
		credits_label.text = "Credit balance: " + str(credits_earned)
		credits_earned = current_credit_balance
