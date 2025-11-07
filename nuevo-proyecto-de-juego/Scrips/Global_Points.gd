extends Node

var points_nivel1: int = 0

var points_nivel2: int = 0

var points_nivel3: int = 0

var rivalPoints: int = 0

var nivel: int = 0

func _process(delta: float) -> void:
	if nivel == 0 and points_nivel1 >= 10:
		nivel += 1
		get_tree().change_scene_to_file("res://Scene/Casas/control.tscn")
	elif rivalPoints >= 10:
		get_tree().change_scene_to_file("res://Scene/Casas/Menu.tscn")

	if nivel == 1 and points_nivel2 >= 15:
		nivel += 1
		get_tree().change_scene_to_file("res://Scene/Casas/control.tscn")
	elif rivalPoints >= 15:
		get_tree().change_scene_to_file("res://Scene/Casas/Menu.tscn")
	
	if nivel == 2 and points_nivel3 >= 18:
		nivel += 1
		get_tree().change_scene_to_file("res://Scene/Casas/control.tscn")
	elif rivalPoints >= 18:
		get_tree().change_scene_to_file("res://Scene/Casas/Menu.tscn")
