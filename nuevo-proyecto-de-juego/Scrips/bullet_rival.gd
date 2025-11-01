extends CharacterBody2D

var direction: Vector2 = Vector2.ZERO
var speed = 800

func _ready() -> void:
	rotation = direction.angle() 

func _physics_process(delta: float) -> void:
	velocity = direction * speed
	move_and_slide()

func _on_area_bala_rival_area_entered(area: Area2D) -> void:
	if area.is_in_group("Casa_Rival"):
		GlobalPoints.rivalPoints += 1
		queue_free()
