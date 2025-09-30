extends CharacterBody2D

var direction = 0.0
var speed = 800

func _ready() -> void:
	rotation = direction

func _physics_process(delta: float) -> void:
	velocity = Vector2(speed,0).rotated(direction)
	move_and_slide()
