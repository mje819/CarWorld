extends Area3D

@export var track : PackedScene = null
var has_track = false

func _on_body_entered(_body: Node3D) -> void:
	print("create track")
	if !has_track:
		var new_track = track.instantiate()
		add_child(new_track)
		new_track.global_position = global_position
		has_track = true
	# create a timer
