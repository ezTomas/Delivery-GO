extends CharacterBody2D


var speed: float = 200.0

#Disparo
var bullet = preload("res://bullet.tscn")
var touch: bool = false
var posicion: Vector2

func _physics_process(delta: float) -> void:
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
	move_and_slide()


func _input(event: InputEvent) -> void:
	if event is InputEventScreenTouch:
		if event.pressed == true:
			touch = true
			shoot()
		else:
			touch = false
	move_and_slide()

func shoot():
	var newBullet = bullet.instantiate()
	newBullet.direction = rotation
	newBullet.global_position = $SpawnPoint.global_position
	get_parent().add_child(newBullet)
