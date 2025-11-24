extends Node


func _on_reiniciar_button_down() -> void:
	get_tree().change_scene_to_file("res://Scene/Mapa.tscn")
	if GlobalPoints.nivel >= 1:
		get_tree().change_scene_to_file("res://nivel_2.tscn")
	if GlobalPoints.nivel >= 2:
		get_tree().change_scene_to_file("res://nivel_3.tscn")


func _on_tienda_button_down() -> void:
	get_tree().change_scene_to_file("res://menu_tienda.tscn")


func _on_menu_principal_button_down() -> void:
	get_tree().change_scene_to_file("res://Escenas/control.tscn")
