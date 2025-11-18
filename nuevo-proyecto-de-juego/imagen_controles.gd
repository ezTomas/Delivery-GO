extends Control

@onready var button: Button = $Button
@onready var timer: Timer = $Timer

func _ready() -> void:
	
	button.visible = false
	timer.wait_time = 3.0
	timer.start()

func _on_button_button_down() -> void:
	get_tree().change_scene_to_file("res://Scene/Mapa.tscn")


func _on_timer_timeout() -> void:
	button.visible = true
