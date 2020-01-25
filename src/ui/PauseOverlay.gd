extends ColorRect

# Declare member variables here. Examples:
# var a = 2
onready var scene_tree = get_tree()
onready var pause_overlay: ColorRect= self

# var b = "text"
var paused : bool = false setget set_paused
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
func _unhandled_input(event:InputEvent) -> void:
	if event.is_action_pressed("pause"):
		self.paused = !paused
		scene_tree.set_input_as_handled()
	pass

func set_paused(value : bool) -> void:
	paused = value
	scene_tree.paused = value
	pause_overlay.visible = value
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_MainMenuButton_button_up():
	print("press")
	set_paused(false)
	get_tree().change_scene_to(load("res://src/ui/MainMenu.tscn"))
	pass # Replace with function body.


func _on_MainMenuButton_button_up2():
	print("test")
	pass # Replace with function body.
