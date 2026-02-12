extends Node

var engine_power : int:
	set(new_engine_power):
		if new_engine_power < 0:
			new_engine_power = 0
		engine_power = new_engine_power
		print("power: " + str(engine_power))

@export var max_health := 10
var health : int :
	set(new_health):
		health = new_health
		print(health)
		#label changes?

func _ready() -> void:
	health = max_health
	engine_power = 150

func _process(_delta: float) -> void:
	# Maybe only for testing
	if Input.is_action_just_pressed("reset"):
		health = max_health
		get_tree().reload_current_scene()

func take_damage() -> void:
	health -= 1
	engine_power -= 15
	
