extends Node2D

@onready var playerPoints: Label = $CanvasLayer/Panel/PlayerPoints
@onready var rivalPoints: Label = $CanvasLayer/Panel2/RivalPoints

var normal_house = [
	preload("res://Scene/Casas/Casas_Jugador/casa.tscn"),
	preload("res://Scene/Casas/Casas_Jugador/Casa2.tscn"),
	preload("res://Scene/Casas/Casas_Jugador/Casa3.tscn")
]

var housePuntos = [
	preload("res://Scene/Casas/Casas_pj_puntos/Casa_pj_puntos1.tscn"),
	preload("res://Scene/Casas/Casas_pj_puntos/Casa_pj_puntos2.tscn"),
	preload("res://Scene/Casas/Casas_pj_puntos/Casa_pj_puntos3.tscn")
]
var houseRivalPuntos = [
	preload("res://Scene/Casas/Casas_rival_puntos/Casa_rival_puntos1.tscn"),
	preload("res://Scene/Casas/Casas_rival_puntos/Casa_rival_puntos2.tscn"),
	preload("res://Scene/Casas/Casas_rival_puntos/Casa_rival_puntos3.tscn")
]

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
		spawnCasa(housePuntos.pick_random())
	else:
		spawnCasa(normal_house.pick_random())

func _on_spawn_house_enemy_timeout() -> void:
	
	var randomHouse = randi_range(1,10)
	if randomHouse <= 2:
		spawnCasaEnemy(houseRivalPuntos.pick_random())
	else:
		spawnCasaEnemy(normal_house.pick_random())

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
