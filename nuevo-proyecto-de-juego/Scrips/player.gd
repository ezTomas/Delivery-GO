extends CharacterBody2D

var speed: float = 200.0
@onready var joy_stick: Area2D = $CanvasLayer/JoyStick
@onready var timer_stun: Timer = $TimerStun

func _physics_process(delta: float) -> void:
	var direction = Input.get_axis("Left", "Right")
	if direction:
		velocity.x = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
	move_and_slide()

#Botones de movimiento

func _on_move_right_pressed() -> void:
	$CanvasLayer/MoveRight.modulate = Color(0.2, 0.2, 0.2)
func _on_move_right_released() -> void:
	$CanvasLayer/MoveRight.modulate = Color(1, 1, 1)
func _on_move_left_pressed() -> void:
	$CanvasLayer/MoveLeft.modulate = Color(0.2, 0.2, 0.2)
func _on_move_left_released() -> void:
	$CanvasLayer/MoveLeft.modulate = Color(1, 1, 1)

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("Obstaculo"):
		joy_stick.stun = true
		timer_stun.start()


func _on_timer_stun_timeout() -> void:
	joy_stick.stun = false
