extends Node

class_name GlobalStarter

@export var audio_player : GlobalAudio

static var instance : GlobalStarter

func _ready() -> void:
	instance = self

static func get_instance() -> GlobalStarter:
	return instance
