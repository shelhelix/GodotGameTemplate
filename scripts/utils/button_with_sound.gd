extends Button

class_name ButtonWithSound

@export var sound_clip : AudioStream

func _ready() -> void:
	pressed.connect(__play_click_sound)

func __play_click_sound() -> void:
	GlobalStarter.get_instance().audio_player.play_sfx(sound_clip)
