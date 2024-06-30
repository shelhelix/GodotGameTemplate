extends Node
@export_category("play button")
@export var play_button: Button
@export_file("*.tscn") var next_scene_name: String

@export_category("others")
@export var settings_button: Button
@export var credits_button: Button
@export var quit_button_container: Control
@export var quit_button: Button

@export_category("animation settings")
@export var hide_offset: Vector2 = Vector2(0, 150)

var buttons_animator: ButtonsAnimator

func _ready() -> void:
	# init buttons
	quit_button_container.visible = not OS.has_feature('web')
	quit_button.pressed.connect(__quit_app)
	play_button.pressed.connect(__start_game)
	# init animation
	buttons_animator = ButtonsAnimator.new() 
	buttons_animator.init([play_button, settings_button, credits_button, quit_button], hide_offset) 
	buttons_animator.hide_elements(true)
	buttons_animator.show_elements()
	
func __start_game() -> void:
	get_tree().change_scene_to_file(next_scene_name)
	pass

func __quit_app() -> void: 
	get_tree().quit()
