extends VehicleBody3D
class_name Car

@export var force := 50
@export var braking_force := 50
@export var max_steer = 0.5
@export var health := 10
#@onready var camera_3d: Camera3D = $Camera3D
@onready var camera_holder: Node3D = $CameraHolder
@onready var audio_stream_player_3d: AudioStreamPlayer3D = $AudioStreamPlayer3D


func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	engine_force = -Input.get_axis("accelerate","brake") * CarManager.engine_power
	#print(self.position)
	steering = move_toward(steering, Input.get_axis("turn_right","turn_left") * max_steer,delta)
	
	if engine_force != 0 and !audio_stream_player_3d.playing:
		audio_stream_player_3d.play()
	if engine_force == 0:
		audio_stream_player_3d.stop()
	
	camera_holder.global_position = global_position
	camera_holder.rotation.y = rotation.y
