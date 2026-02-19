extends Area3D

@export var track : Track
var start_point : Marker3D
var has_track = false

func _ready() -> void:
	if track != null:
		start_point = track.start_point

func _on_body_entered(_body: Node3D) -> void:
	print("create track")
	#if !has_track:
		#var new_track = track.instantiate()
		#add_child(new_track)
		#new_track.position = global_position
	track.visible = true
	has_track = true
	for detector in get_tree().get_nodes_in_group("Start and Finish Detectors"):
		detector.monitoring = true
	_body.global_position = start_point.global_position
	_body.global_rotation = start_point.global_rotation
	_body.engine_force = 0
