class_name ButtonsAnimator

var __show_positions := {}
var __elements : Array[Control]
var __hide_offset : Vector2

func init(elements: Array[Control], hideOffset: Vector2) -> void:
	__elements = elements
	__hide_offset = hideOffset
	for element in __elements:
		__show_positions[element] = element.position

func show_elements(force: bool = false):
	if (force):
		__force_position(true)
	else:
		__create_tween(true, 0.4)

	
func hide_elements(force: bool = false) -> void:
	if (force):
		__force_position(false)
	else:
		__create_tween(false, 0.4)
	
	
func __force_position(active_state: bool) -> void:
	for element in __elements:
		element.position = __get_position(element, active_state)

func __create_tween(active_state: bool, duration: float, delay_betweeen_tweens: float = 0.2) -> void:
	if (__elements.size() == 0):
		return

	var sequence := __elements[0].get_tree().create_tween().set_parallel(true)
	var accumulatedDelay := 0.0
	sequence.chain()
	for element in __elements:
		var end_position := __get_position(element, active_state)
		sequence.tween_property(element, "position", end_position, duration).set_delay(accumulatedDelay).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
		accumulatedDelay += delay_betweeen_tweens
	sequence.play()


func __get_position(element: Node, active_state: bool) -> Vector2:
	return __show_positions[element] if active_state else __show_positions[element] + __hide_offset
