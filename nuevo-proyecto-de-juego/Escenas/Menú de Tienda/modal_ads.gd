extends ColorRect

@onready var texture_rect_2: TextureRect = $TextureRect2
@onready var salir_ad: Button = $Salir_ad
@onready var timer: Timer = $Timer


func _ready():
	self.visible = false
	salir_ad.visible = false

func mostrarAds():
	self.visible = true
	salir_ad.visible = false
	timer.wait_time = 10.0
	timer.start()

func _on_salir_ad_button_down() -> void:
	self.visible = false


func _on_timer_timeout() -> void:
	salir_ad.visible = true
