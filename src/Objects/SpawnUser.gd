extends Node2D

func _ready() -> void:
	PlayerData.connect("update_lives", self, "SpawnPlayer")	
	SpawnPlayer()

func SpawnPlayer() -> void:
	if(PlayerData.lives >= 0):	
		var scene = load("res://src/Actors/Player.tscn")
		var player = scene.instance()
		add_child(player)
