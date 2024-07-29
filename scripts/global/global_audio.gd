extends Node

class_name GlobalAudio

@export var sfx_player : AudioStreamPlayer
@export var music_player : AudioStreamPlayer

func play_sfx(sound: AudioStream) -> void:
	if not sfx_player.playing:
		sfx_player.play()
	var playback := sfx_player.get_stream_playback() as AudioStreamPlaybackPolyphonic
	if not playback:
		printerr("Error: playback is null")
		return
	playback.play_stream(sound)
	
func play_music(sound: AudioStream) -> void:
	music_player.stream = sound
	music_player.play()
	
func stop_music() -> void:
	music_player.stop()
	
func stop_sfx() -> void:
	sfx_player.stop()
	
