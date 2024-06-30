extends Node

@export var buttons: Array[Button] = []
@export var hide_offset: Vector2

var buttons_positions := {}

# Called when the node enters the scene tree for the first time.
func _ready():
	# remember position on the start
	for button in buttons:
		buttons_positions[button] = button.position
	__hide_buttons(true)
	__show_buttons()

func __show_buttons():
	var sequence := get_tree().create_tween().set_parallel(true)
	var delay := 0.2
	var currentDelay := 0.0
	sequence.chain()
	for button in buttons:
		sequence.tween_property(button, "position", buttons_positions[button], 0.4).set_delay(currentDelay).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
		currentDelay += delay
	sequence.play()

func __hide_buttons(force: bool = false):
	if (force):
		for button in buttons:
			button.position = buttons_positions[button] + hide_offset