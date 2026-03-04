extends Path3D
class_name Track

#@export var road : Road = null
@onready var checkpoint_1: Area3D = $Checkpoint1
var checkpoint_1_passed := false
@onready var checkpoint_2: Area3D = $Checkpoint2
var checkpoint_2_passed := false
@onready var checkpoint_3: Area3D = $Checkpoint3
var checkpoint_3_passed := false
@onready var checkpoint_4: Area3D = $Checkpoint4
var checkpoint_4_passed := false

@onready var timer: Timer = $Timer

@onready var start_point: Marker3D = $StartPoint

var audio_player : AudioStreamPlayer

var track1_best_label
var track2_best_label
@export var is_track_1 : bool
var current_time_label

var time_elapsed : float = 0:
	set(new_time):
		time_elapsed = new_time
		#print(time_elapsed) # add ui updating
var best_time : float

var all_checkpoints_passed := false

func _ready() -> void:
	track1_best_label = get_tree().get_first_node_in_group("Track1BestTimeLabel")
	track2_best_label = get_tree().get_first_node_in_group("Track2BestTimeLabel")
	current_time_label = get_tree().get_first_node_in_group("CurrentTime")
	audio_player = AudioManager.get_player()
	
func _on_start_detector_body_entered(_body: Node3D) -> void:
	if visible:
		audio_player.play()
		#print("start timer")
		for checkpoint in get_tree().get_nodes_in_group("Checkpoints"):
			checkpoint.monitoring = true
		timer.start()
		current_time_label.visible = true


func _on_timer_timeout() -> void:
	time_elapsed += 0.1
	current_time_label.text = "Current Time: " + str(round_to_dec(time_elapsed,2))


func _on_finish_detector_body_entered(_body: Node3D) -> void:
	if checkpoint_4_passed and checkpoint_1_passed and checkpoint_2_passed and checkpoint_3_passed:
		all_checkpoints_passed = true

	if all_checkpoints_passed:
		audio_player.play()
		if !timer.is_stopped():
			#print("finished")
			if best_time != 0:
				if time_elapsed < best_time:
					best_time = time_elapsed
					
			else:
				best_time = time_elapsed
		
			timer.stop()
			time_elapsed = 0
			
			#print("Best: " + str(best_time))
			if is_track_1:
				track1_best_label.text = "Track 1 Best time: " + str(round_to_dec(best_time,2))
			else:
				track2_best_label.text = "Track 2 Best time: " + str(round_to_dec(best_time,2))
			
			#current_time_label.visible = false
			reset_checkpoints()

func _on_checkpoint_1_body_entered(_body: Node3D) -> void:
	checkpoint_1_passed = true
	audio_player.play()


func reset_checkpoints():
	checkpoint_1_passed = false
	checkpoint_1.monitoring = false
	
	checkpoint_2_passed = false
	checkpoint_2.monitoring = false
	
	all_checkpoints_passed = false


func _on_checkpoint_2_body_entered(_body: Node3D) -> void:
	checkpoint_2_passed = true
	audio_player.play()

func _on_checkpoint_3_body_entered(_body: Node3D) -> void:
	checkpoint_3_passed = true
	audio_player.play()


func _on_checkpoint_4_body_entered(_body: Node3D) -> void:
	checkpoint_4_passed = true
	audio_player.play()

func round_to_dec(num, digit):
	return round(num * pow(10.0, digit)) / pow(10.0, digit)
