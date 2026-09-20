extends Node

signal ice_hidden_permition
signal milk_hidden_permition
signal sugar_hidden_permition

signal cup_tp_permition(global_position : Vector2)
signal sugar_tp_permition
signal milk_tp_permition
signal ice_tp_permition
var current_credit_balance : int = 0
var credits_earned : int = 0 
var days_count : int = 0
var Wall_repair_box_count : int = 0
var Coffee_Bean_Hack_enabled : bool = false
var Milk_Hack_enabled : bool = false
var Sugar_Hack_enabled : bool = false
var Milk_Cream_Hack_enabled : bool = false
var Ice_Hack_enabled : bool = false
var Cocoa_Hack_enabled : bool = false
var Matcha_Hack_enabled : bool = false
var Cinnamon_Hack_enabled : bool = false
