extends CharacterBody2D

@export var puntuable: bool = true

var speed = 300

func _physics_process(delta: float) -> void:
	position.y += speed * delta
	
	if position.y > 800: # ajusta según el tamaño del viewport
		queue_free()
