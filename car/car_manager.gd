extends Node

@export var health : int :
	set(new_health):
		health = new_health
		print(health)
		#label changes?

func _ready() -> void:
	health = 10

func _process(_delta: float) -> void:
	# Maybe only for testing
	if Input.is_action_pressed("reset"):
		get_tree().reload_current_scene()

func take_damage() -> void:
	health -= 1
