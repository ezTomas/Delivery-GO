extends Node2D

@onready var playerPoints: Label = $CanvasLayer/Panel/PlayerPoints
@onready var rivalPoints: Label = $CanvasLayer/Panel2/RivalPoints



var house1 = preload("res://Scene/Casa.tscn")
var house2 = preload("res://Scene/Casa2.tscn")
var house3 = preload("res://Scene/Casa3.tscn")

var obstaculo = preload("res://Scene/Obstaculo.tscn")

func _ready() -> void:
	randomize()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	playerPoints.text = str(GlobalPoints.points)
	rivalPoints.text = str(GlobalPoints.rivalPoints)

func _on_spawn_house_timeout() -> void:
	
	var randomHouse = round(randf_range(1,3))
	if randomHouse == 1:
		var houseSpawn = house1.instantiate()
		self.call_deferred("add_child", houseSpawn)
		houseSpawn.position.y = -60
		houseSpawn.position.x = round(randf_range(1070,1150))
	
	if randomHouse == 2:
		var houseSpawn = house2.instantiate()
		self.call_deferred("add_child", houseSpawn)
		houseSpawn.position.y = -60
		houseSpawn.position.x = round(randf_range(1120,1200))

	if randomHouse == 3:
		var houseSpawn = house3.instantiate()
		self.call_deferred("add_child", houseSpawn)
		houseSpawn.position.y = -60
		houseSpawn.position.x = round(randf_range(1070,1150))

func _on_spawn_house_enemy_timeout() -> void:
	var randomHouse = round(randf_range(1,3))
	if randomHouse == 1:
		var houseSpawn = house1.instantiate()
		self.call_deferred("add_child", houseSpawn)
		houseSpawn.position.y = -60
		houseSpawn.position.x = round(randf_range(100,200))
	
	if randomHouse == 2:
		var houseSpawn = house2.instantiate()
		self.call_deferred("add_child", houseSpawn)
		houseSpawn.position.y = -60
		houseSpawn.position.x = round(randf_range(50,150))

	if randomHouse == 3:
		var houseSpawn = house3.instantiate()
		self.call_deferred("add_child", houseSpawn)
		houseSpawn.position.y = -60
		houseSpawn.position.x = round(randf_range(100,200))

func _on_spawn_obstaculo_timeout() -> void:
	var randomObstaculo = round(randf_range(1,4))
	if randomObstaculo <= 2:
		var obstaculoSpawn = obstaculo.instantiate()
		self.call_deferred("add_child", obstaculoSpawn)
		obstaculoSpawn.position.y = -60
		obstaculoSpawn.position.x = round(randf_range(700,900))

func _on_spawnobstaculos_enemy_timeout() -> void:
	var randomObstaculo = round(randf_range(1,4))
	if randomObstaculo <= 2:
		var obstaculoSpawn = obstaculo.instantiate()
		self.call_deferred("add_child", obstaculoSpawn)
		obstaculoSpawn.position.y = -60
		obstaculoSpawn.position.x = round(randf_range(300,600))
