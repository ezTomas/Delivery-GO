extends CharacterBody2D

var bullet = preload("res://Scene/BulletRival.tscn")
@onready var stunTimer: Timer = $StunTimer
var stun: bool

@export var limite_right: int = 370
@export var limite_left: int = 500


func _ready() -> void:
	randomize()
	moverse()

func _on_area_deteccion_area_entered(area: Area2D) -> void:
	if area.is_in_group("Casa") && stun == false:
		var disparo = round(randf_range(1,5))
		if disparo <= 2:
			var offset_y = 230.0
			var target_pos = area.global_position + Vector2(0, offset_y)
			var direction = (target_pos - global_position).normalized()
			shoot(direction)

func _on_area_rival_area_entered(area: Area2D) -> void:
	if area.is_in_group("Obstaculo"):
		print("Stuneado")
		stun = true
		stunTimer.start()

func _on_stun_timer_timeout() -> void:
	stun = false

func shoot(direction: Vector2): #Recibe hacia donde debe rotar
	var newBullet = bullet.instantiate()
	newBullet.global_position = $SpawnPointRival.global_position
	newBullet.rotation = direction.angle() # Se usa para calcular el angulo y rotar la bala 
	newBullet.direction = direction
	get_parent().add_child(newBullet)

func moverse():
	while true:
		await get_tree().create_timer(2).timeout
		var moverse = randf_range(1,5)
		var destino = position
		
		if moverse >= 4 && position.x < limite_left:
			destino.x += 70
		elif moverse <= 3 && position.x > limite_right:
			destino.x -= 70
		
		var tween = create_tween()
		tween.tween_property(self, "position", destino, 0.5)
