extends Actor

var dir : = Vector2.ZERO
export var stomp_impulse : = 1000.0

func _on_EnemyDetect_area_entered(area):
	_velocity = calc_stomp_velocity(_velocity, stomp_impulse)

func _on_EnemyDetect_body_entered(body):
#	queue_free()
	die()

func _physics_process(delta):
	var is_jump_interrupted = Input.is_action_just_released("jump") and _velocity.y < 0.0
	dir = get_direction() 
	
	_velocity = calc_velocity(_velocity, dir, speed, is_jump_interrupted)
	_velocity = move_and_slide(_velocity, FLOOR_NORMAL )

func get_direction() -> Vector2:
	return Vector2(
		Input.get_action_strength("move_right") - Input.get_action_strength("move_left"), 
		-1.0 if Input.get_action_strength("jump") and is_on_floor() else 0.0
	)

func calc_velocity(liner_velocity : Vector2, dir : Vector2, speed: Vector2, is_jump_interrupted : bool) -> Vector2:
	var out : = liner_velocity 
	out.x = speed.x * dir.x
	out.y += gravity * get_physics_process_delta_time()
	if dir.y == -1.0:
		out.y = speed.y * dir.y
		
	if is_jump_interrupted:
		out.y = 0; 
	
	return out;

func calc_stomp_velocity(linear_velocity : Vector2, impulse: float) -> Vector2:
	var out := linear_velocity
	out.y = -impulse
	return out

func die() -> void:
	PlayerData.lives -= 5
	queue_free()
	if PlayerData.lives < 0:
		get_tree().change_scene("res://src/Screens/EndScreen.tscn")

