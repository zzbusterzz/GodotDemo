extends Control

onready var details: Label = get_node("Label")
onready var title: Label = get_node("Title")

func _ready():
	if PlayerData.lives < 0:
		title.text = "Sorry You Lost"
	details.text = details.text % [PlayerData.score]
