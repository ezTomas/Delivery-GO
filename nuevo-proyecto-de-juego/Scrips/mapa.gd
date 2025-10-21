extends Node2D

@onready var label: Label = $CanvasLayer/Panel/Label

var house1 = preload("res://Scene/casa.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	label.text = str(GlobalPoints.points)


func _on_spawn_house_timeout() -> void:
	randomize()
	var randomHouse = round(randf_range(1,2))
	
	if randomHouse == 1:
		var houseSpawn = house1.instantiate()
		self.call_deferred("add_child", houseSpawn)
		houseSpawn.position.y = -60
		houseSpawn.position.x = round(randf_range(100,200))
