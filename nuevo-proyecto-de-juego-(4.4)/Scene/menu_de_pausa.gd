extends CanvasLayer

@onready var menu_de_pausa: CanvasLayer = $"."


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_reanudar_pressed() -> void:
	get_tree().paused = false
	menu_de_pausa.visible = false


func _on_tienda_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Escenas/Menú de Tienda/MenuTienda.tscn")


func _on_menu_principal_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Escenas/control.tscn")
