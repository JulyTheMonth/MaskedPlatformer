extends Button

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var levelName = ""
var scene = ""
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func initButton(levelName:String, levelPath : String):
	self.levelName = levelName
	text = self.levelName
	scene = levelPath

func _on_LevelButton_button_up():
	get_tree().change_scene_to(load(scene))
	pass # Replace with function body.

func disableButton():
	disabled = true;
