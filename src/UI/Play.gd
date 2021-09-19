tool
extends Button

export(String, FILE) var next_scene_path = ""

func _on_button_up():
	PlayerData.reset()	
	get_tree().change_scene(next_scene_path);

func _get_configuration_warning() -> String:
	return "Scene path must be set for button" if next_scene_path == "" else ""
