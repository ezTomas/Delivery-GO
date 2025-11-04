extends Node

var points: int = 0

var rivalPoints: int = 0

var nivel: int = 0

func _process(delta: float) -> void:
	if nivel == 0 and points >= 10:
		get_tree().change_scene_to_file("res://nivel_2.tscn")
		nivel += 1
	elif rivalPoints >= 10:
		get_tree().change_scene_to_file("res://Scene/Casas/Menu.tscn")
