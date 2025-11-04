extends Node2D

@onready var player_points: Label = $CanvasLayer/Panel/PlayerPoints
@onready var rival_points: Label = $CanvasLayer/Panel2/RivalPoints


var normal_house = [
	preload("res://Scene/Casas/Casas_Jugador/Bomberos_pj.tscn"),
	preload("res://Scene/Casas/Casas_Jugador/casa_4.tscn"),
	preload("res://Scene/Casas/Casas_Jugador/casa_5.tscn"),
	preload("res://Scene/Casas/Casas_Jugador/kiosko.tscn")
]
var housePuntos = [
	preload("res://Scene/Casas/Casas_pj_puntos/bomberos_pj_puntos.tscn"),
	preload("res://Scene/Casas/Casas_pj_puntos/casa_4_pj_puntos.tscn"),
	preload("res://Scene/Casas/Casas_pj_puntos/casa_5_pj_puntos.tscn"),
	preload("res://Scene/Casas/Casas_pj_puntos/kiosko_Pj_puntos.tscn")
]
var houseRivalPuntos = [
	preload("res://Scene/Casas/Casas_rival_puntos/Bomberos_rival_puntos.tscn"),
	preload("res://Scene/Casas/Casas_rival_puntos/casa_4_rival_puntos.tscn"),
	preload("res://Scene/Casas/Casas_rival_puntos/casa_5_rival_puntos.tscn"),
	preload("res://Scene/Casas/Casas_rival_puntos/kiosko_rival_puntos.tscn")
]

var obstaculos = [
	preload("res://Scene/obstaculo_2.tscn"),
	preload("res://Scene/aceite.tscn"),
	preload("res://Scene/cono.tscn")
]

func _ready() -> void:
	randomize()
	GlobalPoints.points = 0
	GlobalPoints.rivalPoints = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	player_points.text = (str(GlobalPoints.points) + " de 18")
	rival_points.text = (str(GlobalPoints.rivalPoints) + " de 18")

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
	var randomObstaculo = round(randf_range(0,10))
	if randomObstaculo <= 4:
		spawnObstaculo(obstaculos.pick_random())

func _on_spawnobstaculos_enemy_timeout() -> void:
	var randomObstaculo = round(randf_range(0,10))
	if randomObstaculo <= 4:
		spawnRivalObstaculo(obstaculos.pick_random())

func spawnCasa(house):
		var houseSpawn = house.instantiate()
		self.call_deferred("add_child", houseSpawn)
		houseSpawn.position.y = -60
		houseSpawn.position.x = round(randf_range(1120,1200))

func spawnCasaEnemy(house):
		var houseSpawn = house.instantiate()
		self.call_deferred("add_child", houseSpawn)
		houseSpawn.position.y = -60
		houseSpawn.position.x = round(randf_range(50,150))

func spawnObstaculo(obstaculo):
	var obstaculoSpawn = obstaculo.instantiate()
	self.call_deferred("add_child", obstaculoSpawn)
	obstaculoSpawn.position.y = -60
	obstaculoSpawn.position.x = round(randf_range(700,900))

func spawnRivalObstaculo(obstaculo):
	var obstaculoSpawn = obstaculo.instantiate()
	self.call_deferred("add_child", obstaculoSpawn)
	obstaculoSpawn.position.y = -60
	obstaculoSpawn.position.x = round(randf_range(300,600))
