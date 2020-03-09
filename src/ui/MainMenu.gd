extends Control

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var pointipointer = load("res://assets/pointipointer.png")
# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_custom_mouse_cursor(pointipointer);
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_ExitGame_button_up():
	get_tree().quit()
	pass # Replace with function body.


func _on_LevelSelect_button_up():
	get_tree().change_scene_to(load("res://src/ui/LevelSelect.tscn"))
	pass # Replace with function body.
