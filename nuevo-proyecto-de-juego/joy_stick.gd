extends Area2D

@onready var big_circle: Sprite2D = $Big_circle
@onready var small_circle: Sprite2D = $Big_circle/Small_circle
@onready var max_distance = $CollisionShape2D.shape.radius

var bullet = preload("res://Scene/bullet.tscn")

var touch = false 

func _input(event: InputEvent) -> void:
	if event is InputEventScreenTouch:
		var distance = event.position.distance_to(big_circle.global_position)
		if not touch:
			if distance < max_distance:
				touch = true
		else:
			var direction = (small_circle.global_position - big_circle.global_position).normalized()
			shoot(direction)
			small_circle.position = Vector2(0,0)
			touch = false

func _process(delta: float) -> void:
	if touch:
		small_circle.global_position = get_global_mouse_position()
		small_circle.position = big_circle.position + (small_circle.position - big_circle.position).limit_length(max_distance)


func shoot(direction: Vector2): #Recibe hacia donde debe rotar
	var newBullet = bullet.instantiate()
	newBullet.global_position = $Big_circle/Small_circle/SpawnPoint.global_position
	newBullet.rotation = direction.angle() # Se usa para calcular el angulo y rotar la bala 
	newBullet.direction = direction
	get_parent().add_child(newBullet)
