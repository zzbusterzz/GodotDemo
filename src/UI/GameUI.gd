extends Control

onready var scene_tree:=get_tree()
onready var overlay: ColorRect =get_node("Overlay")

var paused: = false setget set_paused

func _unhandled_input(event) -> void:
	if event.is_action_pressed("Pause"):
		self.paused = !paused
		scene_tree.set_input_as_handled()

func set_paused(value:bool) -> void:
	paused = value
	scene_tree.paused =value
	overlay.visible = value
