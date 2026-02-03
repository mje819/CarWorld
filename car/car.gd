extends VehicleBody3D

@export var force := 50
@export var braking_force := 50
@export var max_steer = 0.9

func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	engine_force = -Input.get_axis("accelerate","brake") * force
	#print(self.position)
	steering = move_toward(steering, Input.get_axis("turn_right","turn_left") * 0.9,delta)
	
	# Maybe only for testing
	if Input.is_action_pressed("reset"):
		get_tree().reload_current_scene()
