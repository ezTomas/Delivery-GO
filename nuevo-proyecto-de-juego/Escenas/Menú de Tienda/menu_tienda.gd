extends Control

@onready var modal_ads: ColorRect = $Modal_ads
@onready var modal_compra: ColorRect = $Modal_Compra


func _on_ver_button_down() -> void:
	modal_ads.mostrarAds()


func _on_volver_button_down() -> void:
	get_tree().change_scene_to_file("res://Escenas/control.tscn")


func _on_comprar_button_down() -> void:
	modal_compra.mostrarAds()
