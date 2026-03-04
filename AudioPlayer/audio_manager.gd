extends Node

@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer

func get_player():
	return audio_stream_player
