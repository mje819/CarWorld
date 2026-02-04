extends CSGBox3D

@onready var area_3d: Area3D = $Area3D



func _on_area_3d_body_entered(body: Node3D) -> void:
	if body is Car:
		CarManager.take_damage()
