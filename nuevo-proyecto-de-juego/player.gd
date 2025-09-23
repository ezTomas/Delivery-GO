extends CharacterBody2D


var speed = 300.0
var touch: bool = false
var posicion: Vector2
var movimiento: Vector2

func _input(event: InputEvent) -> void:
	if event is InputEventScreenTouch or event is InputEventMouseButton:
		if event.pressed == true:
			touch = true
			posicion = event.position
		else:
			touch = false

func _process(delta: float) -> void:
	if touch:
		var direccion = (posicion - global_position).normalized()
		velocity = direccion * speed
	else:
			velocity = Vector2.ZERO
	move_and_slide()
