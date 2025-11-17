extends Control


@onready var modal_Ads = $ModalAds


func _on_button_button_down() -> void:
	get_tree().change_scene_to_file("res://Escenas/control.tscn")




func _on_ver_button_down() -> void:
	modal_Ads.MostrarAds()
