extends Actor

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var jumpSound = load("res://assets/SoundEffekt/jump.wav")
var impactSound = preload("res://assets/SoundEffekt/impact.wav")
var doorSound = load("res://assets/SoundEffekt/door.wav")

var is_movable: bool
# Called when the node enters the scene tree for the first time.
func _ready():
	print("ready")
	is_movable = false
	$AudioPlayer.stream = impactSound
	$AudioPlayer.play()
	$RespawnTimer.start()
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#
func _physics_process(delta) -> void:
	var is_jump_interrupted = Input.is_action_just_released("jump") and velocity.y < 0.0
	var direction = get_direction()
	velocity = calculate_move_velocitry(velocity, direction, is_jump_interrupted)
	setAnimation(direction, velocity)
	if Input.is_action_just_pressed("jump") and is_player_on_ground() and is_movable:
		$AudioPlayer.stream = jumpSound
		$AudioPlayer.play()
	velocity = move_and_slide(velocity, Vector2(0,-2))
	
func is_player_on_ground() -> bool:
	return $FloorCast.is_colliding() or $LeftFloorCast.is_colliding() or $RightFloorCast.is_colliding()

func get_direction() -> Vector2:
	return Vector2(
		Input.get_action_strength("move_right") - Input.get_action_strength("move_left") if is_movable else 0.0,
		-1.0 if Input.is_action_just_pressed("jump") and is_player_on_ground()  else 0.0
	)
func setAnimation(
		direction:Vector2,
		velocity:Vector2
	)->void:
	if direction.x != 0:
		$Sprite.scale.x = direction.x *4
	if is_player_on_ground():
		if direction.x != 0:
			$AnimationPlayer.play("Running")
		else:
			$AnimationPlayer.play("Idle")
		
	if velocity.y < 0:
		print("jump")
		$AnimationPlayer.play("Jump")
	elif velocity.y >0 :
		$AnimationPlayer.play("Fall")
	pass

func calculate_move_velocitry(
		linear_velocity:Vector2,
		direction:Vector2,
		is_jump_interrupted: bool
	) -> Vector2:
	var new_velocity: = linear_velocity
	new_velocity.x = speed.x * direction.x
	if is_jump_interrupted:
		print("interrupted")
		new_velocity.y = 400
#		new_velocity.y += gravity*30 * get_physics_process_delta_time()
	elif !is_player_on_ground():
		new_velocity.y += gravity * get_physics_process_delta_time()
	else:
		new_velocity.y = 0
	if direction.y == -1.0 and is_movable:
		new_velocity.y = speed.y * direction.y
	velocity.y = min(gravity, velocity.y)	
	return new_velocity

func _on_SpikeHitBox_area_entered(area:Area2D):
	if (area.get_collision_layer_bit(2)):
		print("spike")

#		yield($AudioPlayer, "finished")
		get_tree().reload_current_scene()
	
		
	pass # Replace with function body.


func _on_RespawnTimer_timeout():
	is_movable=true
	pass # Replace with function body.


func _on_DoorHitBox_area_entered(area: Area2D):
	if (area.get_collision_layer_bit(3)):
		print("door")
		$AudioPlayer.stream = doorSound
		$AudioPlayer.play()
		is_movable=false
	pass # Replace with function body.
