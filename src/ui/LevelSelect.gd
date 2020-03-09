extends Control

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var levelbutton = preload("res://src/ui/LevelButton.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	var allLevels:Array = Gamedata.getAllLevels()
	var progress:int = Gamedata.getProgress()
	var counter: int = 0
	for level in allLevels:
		print(counter)
		var instance= levelbutton.instance()
		instance.initButton(level["name"], level["path"])
		if counter > progress+1:
			instance.disableButton() 
		counter+=1
		$Levels.add_child(instance)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

