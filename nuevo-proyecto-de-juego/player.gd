extends CharacterBody2D

var bullet = preload("res://bullet.tscn")
var speed = 300.0
var touch: bool = false
var posicion: Vector2
var movimiento: Vector2

func _input(event: InputEvent) -> void:
	if event is InputEventScreenTouch:
		if event.pressed == true:
			touch = true
			shoot()
			rotation = (event.position - global_position).angle()
		else:
			touch = false
	move_and_slide()

func shoot():
	var newBullet = bullet.instantiate()
	newBullet.direction = rotation
	newBullet.global_position = $SpawnPoint.global_position
	get_parent().add_child(newBullet)
