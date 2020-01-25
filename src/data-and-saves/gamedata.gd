extends Node

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var progress = 0

var levels :Array = [
{"path": "res://src/Levels/00_Startscreen.tscn",
"name":"Tutorial 1"},
{"path":"res://src/Levels/02_Mask.tscn",
"name":"Tutorial 2"},
{"path":"res://src/Levels/04_OfficialStart.tscn",
"name":"Level 1 "},
{"path":"res://src/Levels/06_Level2.tscn",
"name":"Level 2"},
{"path":"res://src/Levels/07_Level3.tscn",
"name":"Level 3"},
{"path":"res://src/Levels/08_Level4.tscn",
"name":"Level 4"},
{"path":"res://src/Levels/09_Level5.tscn",
"name":"Level 5"},
{"path":"res://src/Levels/10_Level6.tscn",
"name":"Level 6"},
{"path":"res://src/Levels/11_Level7.tscn",
"name":"Level 7"},
{"path":"res://src/Levels/12_End.tscn",
"name":"End Screen"}
]
# Called when the node enters the scene tree for the first time.
func _ready():
	loadProgress()
	pass # Replace with function body.

func getAllLevels() -> Array:
	return levels

func getLevel(level:int) -> Dictionary:
	return levels[level]

func getProgress()-> int:
	return progress

func saveProgress():
	print("save")
	var save_game = File.new()
	save_game.open("user://savegame.save", File.WRITE)
	save_game.store_line(to_json({"progress":progress}))
	save_game.close()

func setProgress(progress:int):
	if self.progress<progress:
		self.progress = progress
		saveProgress()
	

func loadProgress():
	print("load")
	var save_game = File.new()
	if not save_game.file_exists("user://savegame.save"):
		return # Error! We don't have a save to load
	
	save_game.open("user://savegame.save", File.READ)

	var current_line = parse_json(save_game.get_line())
	progress = current_line["progress"]
	print(progress)
	save_game.close()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
