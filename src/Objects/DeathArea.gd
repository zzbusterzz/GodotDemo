tool
extends Area2D	

func _on_DeathArea_body_entered(body):
	PlayerData.lives -= 1
	body.queue_free()
