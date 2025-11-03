extends Node2D

@onready var playerPoints: Label = $CanvasLayer/Panel/PlayerPoints
@onready var rivalPoints: Label = $CanvasLayer/Panel2/RivalPoints

var house1 = preload("res://Scene/Casas/Casas_Jugador/casa.tscn")
var house2 = preload("res://Scene/Casas/Casas_Jugador/Casa2.tscn")
var house3 = preload("res://Scene/Casas/Casas_Jugador/Casa3.tscn")

var housePuntos1 = preload("res://Scene/Casas/Casas_pj_puntos/Casa_pj_puntos1.tscn")
var housePuntos2 = preload("res://Scene/Casas/Casas_pj_puntos/Casa_pj_puntos2.tscn")
var housePuntos3 = preload("res://Scene/Casas/Casas_pj_puntos/Casa_pj_puntos3.tscn")

var houseRival1 = preload("res://Scene/Casas/Casas_Rival/CasaRival1.tscn")
var houseRival2 = preload("res://Scene/Casas/Casas_Rival/CasaRival2.tscn")
var houseRival3 = preload("res://Scene/Casas/Casas_Rival/CasaRival3.tscn")

var houseRivalPuntos1 = preload("res://Scene/Casas/Casas_rival_puntos/Casa_rival_puntos1.tscn")
var houseRivalPuntos2= preload("res://Scene/Casas/Casas_rival_puntos/Casa_rival_puntos2.tscn")
var houseRivalPuntos3= preload("res://Scene/Casas/Casas_rival_puntos/Casa_rival_puntos3.tscn")

var obstaculo = preload("res://Scene/Obstaculo.tscn")

func _ready() -> void:
	randomize()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	playerPoints.text = str(GlobalPoints.points)
	rivalPoints.text = str(GlobalPoints.rivalPoints)

func _on_spawn_house_timeout() -> void:
	var randomHouse = randi_range(1,10)
	if randomHouse <= 2:
		var pointHouse = randi_range(1, 3)
		match pointHouse:
			1: spawnCasa(housePuntos1)
			2: spawnCasa(housePuntos2)
			3: spawnCasa(housePuntos3)
	else:
		var normalHouse = randi_range(1, 3)
		match normalHouse:
			1: spawnCasa(house1)
			2: spawnCasa(house2)
			3: spawnCasa(house3)
			
func _on_spawn_house_enemy_timeout() -> void:
	
	var randomHouse = randi_range(1,10)
	if randomHouse <= 2:
		var pointHouse = randi_range(1, 3)
		match pointHouse:
			1: spawnCasaEnemy(houseRivalPuntos1)
			2: spawnCasaEnemy(houseRivalPuntos2)
			3: spawnCasaEnemy(houseRivalPuntos3)
	else:
		var normalHouse = randi_range(1, 3)
		match normalHouse:
			1: spawnCasaEnemy(houseRival1)
			2: spawnCasaEnemy(houseRival2)
			3: spawnCasaEnemy(houseRival3)

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

func spawnCasa(house):
		var houseSpawn = house.instantiate()
		self.call_deferred("add_child", houseSpawn)
		houseSpawn.position.y = -60
		houseSpawn.position.x = round(randf_range(1090,1200))


func spawnCasaEnemy(house):
		var houseSpawn = house.instantiate()
		self.call_deferred("add_child", houseSpawn)
		houseSpawn.position.y = -60
		houseSpawn.position.x = round(randf_range(100,200))
