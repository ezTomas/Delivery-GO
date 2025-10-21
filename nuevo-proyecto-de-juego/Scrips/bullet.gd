extends CharacterBody2D

var direction: Vector2 = Vector2.ZERO
var speed = 800

func _ready() -> void:
	rotation = direction.angle() 

func _physics_process(delta: float) -> void:
	velocity = direction * speed
	move_and_slide()
