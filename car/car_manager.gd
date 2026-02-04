extends Node

@export var health : int :
	set(new_health):
		health = new_health
		print(health)
		#label changes?

func _ready() -> void:
	health = 10

func take_damage() -> void:
	health -= 1
