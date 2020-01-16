tool
extends Area2D

onready var anim_player: AnimationPlayer = $TranstionPlayer
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var nextLevel: PackedScene


func _get_configuration_warning() -> String:
	if(!nextLevel):
		return "Select Next Scene"
	return ""
# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.
func teleport()->void:
	anim_player.play("Fade_in")
	yield(anim_player, "animation_finished")
	get_tree().change_scene_to(nextLevel)
	pass
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_body_entered(body):
	teleport()

