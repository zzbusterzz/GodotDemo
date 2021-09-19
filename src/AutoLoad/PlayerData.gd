extends Node

signal update_score
signal update_lives

var score: = 0 setget set_score
var lives: = 5 setget set_lives

func reset() -> void:
	score = 0
	lives = 5	

func set_score(value : int) -> void:
	score = value
	emit_signal("update_score")
	
func set_lives(value : int) -> void:
	lives = value
	emit_signal("update_lives")
