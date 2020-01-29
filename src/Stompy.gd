extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var velocity : Vector2= Vector2.ZERO

export(int) var speed = 4500
export(int) var maxSpeed = 2000

var activated: bool = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _physics_process(delta):
	if $Left.is_colliding() or $Right.is_colliding():
		activated = true;
		pass
	
	if activated and !is_on_wall():
		velocity.y += speed*delta
		velocity.y = min(velocity.y, maxSpeed)
	else:
		velocity = Vector2.ZERO
	print(velocity)
	move_and_slide(velocity);