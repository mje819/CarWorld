extends Path3D
class_name Track

@onready var timer: Timer = $Timer
var time_elapsed : float = 0:
	set(new_time):
		time_elapsed = new_time
		print(time_elapsed) # add ui updating
var best_time : float

func _on_start_detector_body_entered(_body: Node3D) -> void:
	print("start timer")
	timer.start()


func _on_timer_timeout() -> void:
	time_elapsed += 0.1


func _on_finish_detector_body_entered(_body: Node3D) -> void:
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
