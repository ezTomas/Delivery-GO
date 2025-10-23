extends CharacterBody2D

var bullet = preload("res://Scene/BulletRival.tscn")

func _ready() -> void:
	randomize()

func _on_area_deteccion_area_entered(area: Area2D) -> void:
	if area.is_in_group("Casa"):
		var disparo = round(randf_range(1,5))
		if disparo <= 2:
			var offset_y = 230.0
			var target_pos = area.global_position + Vector2(0, offset_y)
			var direction = (target_pos - global_position).normalized()
			shoot(direction)

func shoot(direction: Vector2): #Recibe hacia donde debe rotar
	var newBullet = bullet.instantiate()
	newBullet.global_position = $SpawnPointRival.global_position
	newBullet.rotation = direction.angle() # Se usa para calcular el angulo y rotar la bala 
	newBullet.direction = direction
	get_parent().add_child(newBullet)
