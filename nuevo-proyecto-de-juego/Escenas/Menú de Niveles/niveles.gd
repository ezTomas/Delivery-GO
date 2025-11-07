extends Control

const CANDADO_ABIERTO = preload("uid://bgx1lrfoswqks")

func _on_button_Volver_down() -> void:
	get_tree().change_scene_to_file("res://Escenas/control.tscn")


func _on_nivel_1_pressed() -> void:
	get_tree().change_scene_to_file("res://Scene/Mapa.tscn")

func _on_nivel_2_pressed() -> void:
	if GlobalPoints.nivel >= 1:
		get_tree().change_scene_to_file("res://nivel_2.tscn")
		$"ColorRect/HBoxContainer/2/VBoxContainer/Nivel 2".icon = CANDADO_ABIERTO

func _on_nivel_3_pressed() -> void:
	if GlobalPoints.nivel >= 2:
		get_tree().change_scene_to_file("res://nivel_3.tscn")
		$"ColorRect/HBoxContainer/3/VBoxContainer/Nivel 3".icon = CANDADO_ABIERTO

func estrellasNivel1():
	if GlobalPoints.points_nivel1 >= 3:
		pass
