extends Control


func _on_tienda_button_down() -> void:
	get_tree().change_scene_to_file("res://menu_tienda.tscn")


func _on_menu_principal_button_down() -> void:
	get_tree().change_scene_to_file("res://Escenas/control.tscn")
