extends Control

onready var scene_tree:=get_tree()
onready var overlay: ColorRect =get_node("Overlay")
onready var score: Label = get_node("Label")
onready var life: Label = get_node("LifeLabel")

var paused: = false setget set_paused

func _ready() -> void:
	PlayerData.connect("update_score", self, "update_interface")
	PlayerData.connect("update_lives", self, "update_playerLife")
	update_interface()
	update_playerLife()
		
func _unhandled_input(event) -> void:
	if event.is_action_pressed("Pause"):
		self.paused = !paused
		scene_tree.set_input_as_handled()

func update_interface() -> void:
	score.text = "Score: %s" % PlayerData.score

func update_playerLife() -> void:
	life.text = "Life: %s" % PlayerData.lives
	
func set_paused(value:bool) -> void:
	paused = value
	scene_tree.paused = value
	overlay.visible = value
