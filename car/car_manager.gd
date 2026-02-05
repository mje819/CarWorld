extends Node


@export var max_health := 10
var health : int :
	set(new_health):
		health = new_health
		print(health)
		#label changes?

func _ready() -> void:
	health = max_health

func _process(_delta: float) -> void:
	# Maybe only for testing
	if Input.is_action_just_pressed("reset"):
		health = max_health
		get_tree().reload_current_scene()

func take_damage() -> void:
	health -= 1
