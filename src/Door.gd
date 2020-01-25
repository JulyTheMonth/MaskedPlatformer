tool
extends Area2D

onready var anim_player: AnimationPlayer = $TranstionPlayer
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var nextLevel: String

export var currentLevelNumber : int = 0

func _get_configuration_warning() -> String:
	if(currentLevelNumber <0):
		return "Set Level Number"
	return ""
# Called when the node enters the scene tree for the first time.
func _ready():
	var level = Gamedata.getLevel(currentLevelNumber+1)
	nextLevel = level["path"]
	pass # Replace with function body.

func teleport()->void:
	anim_player.play("Fade_in")
	yield(anim_player, "animation_finished")
	get_tree().change_scene_to(load(nextLevel))
	pass
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func setProgress():
	Gamedata.setProgress(currentLevelNumber)

func _on_body_entered(body):
	setProgress()
	teleport()

