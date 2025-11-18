extends ColorRect

@onready var texture_rect: TextureRect = $TextureRect
@onready var compra: Button = $TextureRect/Compra

@onready var salir: Button = $TextureRect/Salir
var comprable: bool = true

func _ready():
	self.visible = false
	salir.visible = false
	compra.visible = false
	

func mostrarAds():
	self.visible = true
	salir.visible = true
	compra.visible = true
	comprable = true

func _on_salir_button_down() -> void:
	self.visible = false
	compra.visible = false


func _on_compra_button_down() -> void:
	if comprable == true:
		GlobalPoints.monedas += 100
		comprable = false
