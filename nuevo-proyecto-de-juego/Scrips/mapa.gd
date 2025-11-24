extends Node2D

@onready var player_points: Label = $CanvasLayer/PlayerPoints
@onready var rival_points: Label = $CanvasLayer/Panel2/RivalPoints
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer
@onready var propinas: Label = $CanvasLayer/Propinas

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

var obstaculos=[
	preload("res://Scene/Obstaculo.tscn"),
	preload("res://Scene/obstaculo_2.tscn")
]

func _ready() -> void:
	randomize()
	GlobalPoints.points_nivel1 = 0
	GlobalPoints.rivalPoints = 0
	MusicManager.audio_stream_player.stop()
	audio_stream_player.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	player_points.text = (str(GlobalPoints.points_nivel1) + " de 10")
	rival_points.text = (str(GlobalPoints.rivalPoints) + " de 10")
	propinas.text = (str(GlobalPoints.monedas) + " Propinas")

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
		spawnObstaculo(obstaculos.pick_random())

func _on_spawnobstaculos_enemy_timeout() -> void:
	var randomObstaculo = round(randf_range(1,4))
	if randomObstaculo <= 2:
		spawnRivalObstaculo(obstaculos.pick_random())

func spawnCasa(house):
		var houseSpawn = house.instantiate()
		self.call_deferred("add_child", houseSpawn)
		houseSpawn.position.y = -60
		houseSpawn.position.x = round(randf_range(1100,1250))

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


func _on_audio_stream_player_finished() -> void:
	audio_stream_player.play()
