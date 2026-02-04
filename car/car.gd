extends VehicleBody3D
class_name Car

@export var force := 50
@export var braking_force := 50
@export var max_steer = 0.9
@export var health := 10
#@onready var camera_3d: Camera3D = $Camera3D
@onready var camera_holder: Node3D = $CameraHolder


func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	engine_force = -Input.get_axis("accelerate","brake") * force
	#print(self.position)
	steering = move_toward(steering, Input.get_axis("turn_right","turn_left") * 0.9,delta)
	
	
	
	camera_holder.global_position = global_position
	camera_holder.rotation.y = rotation.y
