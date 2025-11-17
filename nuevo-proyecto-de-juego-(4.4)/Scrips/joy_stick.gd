extends Area2D

@onready var rango: Sprite2D = $Rango
@onready var palanca: Sprite2D = $Rango/Palanca
@onready var radio = $CollisionShape2D.shape.radius

var distance: float
var direccion: Vector2
var index: int = -1

var bullet = preload("res://Scene/Player/bulletPlayer.tscn")
var stun: bool = false

func _process(delta: float) -> void:
		if stun == true:
			palanca.position = Vector2.ZERO
			direccion = Vector2.ZERO

func _input(event: InputEvent) -> void:
	if event is InputEventScreenTouch && stun == false:
		if event.is_pressed() && index == -1:
			distance = global_position.distance_to(event.position)
			if distance <= radio:
				index = event.index
				palanca.global_position = event.position
				direccion = global_position.direction_to(palanca.global_position)
		elif event.index == index:
			shoot(-direccion)
			index = -1
			palanca.position = Vector2.ZERO
			direccion = Vector2.ZERO
			

	if event is InputEventScreenDrag && stun == false:
		if event.index == index:
			distance = global_position.distance_to(event.position)
			if distance <= radio:
				palanca.global_position = event.position
				direccion = global_position.direction_to(palanca.global_position)
			else:
				direccion = global_position.direction_to(event.position)
				palanca.global_position = global_position + (direccion * radio) 

func shoot(direction: Vector2): #Recibe hacia donde debe rotar
	var newBullet = bullet.instantiate()
	newBullet.global_position = $"../../SpawnPoint".global_position
	newBullet.rotation = direction.angle() # Se usa para calcular el angulo y rotar la bala 
	newBullet.direction = direction
	get_parent().add_child(newBullet)
