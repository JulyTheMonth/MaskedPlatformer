extends Actor

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#
func _physics_process(delta) -> void:
	var is_jump_interrupted = Input.is_action_just_released("jump") and velocity.y < 0.0
	var direction = get_direction()
	velocity = calculate_move_velocitry(velocity, direction, is_jump_interrupted)
	velocity = move_and_slide(velocity, Vector2.UP)
	
func get_direction() -> Vector2:
	return Vector2(
		Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
		-1.0 if Input.is_action_just_pressed("jump") and is_on_floor()  else 0.0
	)
	
func calculate_move_velocitry(
		linear_velocity:Vector2,
		direction:Vector2,
		is_jump_interrupted: bool
	) -> Vector2:
	var new_velocity: = linear_velocity
	new_velocity.x = speed.x * direction.x
	if is_jump_interrupted:
		print("interrupted")
		new_velocity.y += gravity*8 * get_physics_process_delta_time()
	else:
		new_velocity.y += gravity * get_physics_process_delta_time()
	if direction.y == -1.0:
		new_velocity.y = speed.y * direction.y
	velocity.y = min(gravity, velocity.y)
	print(velocity)
	
	return new_velocity