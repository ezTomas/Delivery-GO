extends ColorRect

@onready var texture_rect: TextureRect = $TextureRect
@onready var compra: Button = $TextureRect/Compra
@onready var timer: Timer = $Timer

@onready var salir: Button = $TextureRect/Salir


func _ready():
	self.visible = false
	salir.visible = false
	compra.visible = false

func mostrarAds():
	self.visible = true
	salir.visible = true
	compra.visible = true

func _on_salir_button_down() -> void:
	self.visible = false
	compra.visible = false
