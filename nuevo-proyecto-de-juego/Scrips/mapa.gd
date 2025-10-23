extends Node2D

@onready var playerPoints: Label = $CanvasLayer/Panel/PlayerPoints
@onready var rivalPoints: Label = $CanvasLayer/Panel2/RivalPoints

var house1 = preload("res://Scene/Casa.tscn")
var obstaculo = preload("res://Scene/Obstaculo.tscn")

func _ready() -> void:
	randomize()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	playerPoints.text = str(GlobalPoints.points)
	rivalPoints.text = str(GlobalPoints.rivalPoints)

func _on_spawn_house_timeout() -> void:
	var randomHouse = round(randf_range(1,1))
	
	if randomHouse == 1:
		var houseSpawn = house1.instantiate()
		self.call_deferred("add_child", houseSpawn)
		houseSpawn.position.y = -60
		houseSpawn.position.x = round(randf_range(200,200))
	
	if randomHouse == 1:
		var houseSpawn = house1.instantiate()
		self.call_deferred("add_child", houseSpawn)
		houseSpawn.position.y = -60
		houseSpawn.position.x = round(randf_range(1000,1000))


func _on_spawn_obstaculo_timeout() -> void:
	var randomObstaculo = round(randf_range(1,4))
	if randomObstaculo <= 4:
		var obstaculoSpawn = obstaculo.instantiate()
		self.call_deferred("add_child", obstaculoSpawn)
		obstaculoSpawn.position.y = -60
		obstaculoSpawn.position.x = round(randf_range(700,900))
