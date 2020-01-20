extends Control

# Declare member variables here. Examples:
# var a = 2
onready var scene_tree = get_tree()
onready var pause_overlay: ColorRect= $PauseOverlay
export var mask_enabled :bool = true

onready var mask : Control = $Mask
var blankpointer = load("res://assets/blankpointer.png")
var pointipointer = load("res://assets/pointipointer.png")
# var b = "text"
var paused : bool = false setget set_paused
# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_custom_mouse_cursor(blankpointer)
	mask.visible = mask_enabled
	pass # Replace with function body.
func _unhandled_input(event:InputEvent) -> void:
	if event.is_action_pressed("pause"):
		self.paused = !paused
		if self.paused:
			Input.set_custom_mouse_cursor(pointipointer)
		else:
			Input.set_custom_mouse_cursor(blankpointer)
		scene_tree.set_input_as_handled()
	pass
func set_paused(value : bool) -> void:
	paused = value
	scene_tree.paused = value
	pause_overlay.visible = value
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass