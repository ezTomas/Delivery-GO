extends Control

@onready var colorRect = $ColorRect
@onready var imagenZorrito = $ColorRect/imagenfalopa
@onready var timerCerrar = $ColorRect/timerSalida
@onready var botonCerrar = $ColorRect/cerrarAds


func _Ready():
	visible = false
	botonCerrar.visible = false


func MostrarAds():
	visible = true
	botonCerrar.visible = false
	timerCerrar.wait_time = 25.0
	timerCerrar.start()




func _on_timer_salida_timeout() -> void:
	botonCerrar.visible = true



func _on_cerrar_ads_button_down() -> void:
	visible = false
