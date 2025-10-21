extends Node2D

@onready var label: Label = $CanvasLayer/Panel/Label


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	label.text = str(GlobalPoints.points)
