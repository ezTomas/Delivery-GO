extends CharacterBody2D


var direction: Vector2 = Vector2.ZERO
var speed = 800

func _ready() -> void:
	rotation = direction.angle() 

func _physics_process(delta: float) -> void:
	velocity = direction * speed
	move_and_slide()

func _on_area_bala_player_area_entered(area: Area2D) -> void:
	if area.is_in_group("Casa"):
		if GlobalPoints.nivel >= 0:
			GlobalPoints.points_nivel1 += 1
			area.remove_from_group("Casa")
			queue_free()
			
		if GlobalPoints.nivel >= 1:
			GlobalPoints.points_nivel2 += 1
			area.remove_from_group("Casa")
			queue_free()
		if GlobalPoints.nivel >= 2:
			GlobalPoints.points_nivel3 += 1
			area.remove_from_group("Casa")
			queue_free()
