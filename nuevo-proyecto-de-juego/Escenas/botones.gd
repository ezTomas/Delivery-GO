extends VBoxContainer

func Jugar_on_button_button_down() -> void:
	get_tree().change_scene_to_file("res://Escenas/Menú de Niveles/Niveles.tscn")


func Tienda_on_button_button_down() -> void:
	get_tree().change_scene_to_file("res://menu_tienda.tscn")


func Ayuda_on_button_button_down() -> void:
	get_tree().change_scene_to_file("res://Escenas/Menú de Ayuda/Ayuda.tscn")


func Creditos_on_button_button_down() -> void:
	get_tree().change_scene_to_file("res://Escenas/Menú de Créditos/Creditos.tscn")


func _on_b_controles_button_down() -> void:
	get_tree().change_scene_to_file("res://controles.tscn")
