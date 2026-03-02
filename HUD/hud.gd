extends MarginContainer

@onready var health_label: Label = $VBoxContainer/HealthLabel

var manager = CarManager

func _ready() -> void:
	CarManager.hurt_car.connect(_on_hurt_car)

func _on_hurt_car(health : int) -> void:
	health_label.text = "Health: " + str(health)
