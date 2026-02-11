extends Path3D
class_name Track

#@export var road : Road = null
@onready var checkpoint_1: Area3D = $Checkpoint1
var checkpoint_1_passed := false
@onready var checkpoint_2: Area3D = $Checkpoint2
var checkpoint_2_passed := false

@onready var timer: Timer = $Timer
var time_elapsed : float = 0:
	set(new_time):
		time_elapsed = new_time
		print(time_elapsed) # add ui updating
var best_time : float

var all_checkpoints_passed := false

func _on_start_detector_body_entered(_body: Node3D) -> void:
	print("start timer")
	for checkpoint in get_tree().get_nodes_in_group("Checkpoints"):
		checkpoint.monitoring = true
	timer.start()


func _on_timer_timeout() -> void:
	time_elapsed += 0.1


func _on_finish_detector_body_entered(_body: Node3D) -> void:
	if checkpoint_1_passed and checkpoint_2_passed:
		all_checkpoints_passed = true
	if all_checkpoints_passed:
		if !timer.is_stopped():
			print("finished")
			if best_time != 0:
				if time_elapsed < best_time:
					best_time = time_elapsed
			else:
				best_time = time_elapsed
		
			timer.stop()
			time_elapsed = 0
			
			print("Best: " + str(best_time))
			reset_checkpoints()


func _on_checkpoint_1_body_entered(_body: Node3D) -> void:
	checkpoint_1_passed = true


func reset_checkpoints():
	checkpoint_1_passed = false
	checkpoint_1.monitoring = false
	
	checkpoint_2_passed = false
	checkpoint_2.monitoring = false
	
	all_checkpoints_passed = false


func _on_checkpoint_2_body_entered(_body: Node3D) -> void:
	checkpoint_2_passed = true
