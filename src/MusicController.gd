extends Control

# Load the music player node
onready var _player = $AudioStreamPlayer

var currentTrackNumber:int 

var trackList:Array =[
"res://assets/Music/01KnockYourselfIn.ogg",
"res://assets/Music/02HereComesthe8-bitEmpire.ogg",
"res://assets/Music/04BoktipsetFranHelvetet.ogg",
"res://assets/Music/06Satisfucktion.ogg",
"res://assets/Music/08AWellWorkedAnalogy.ogg",
"res://assets/Music/09TheDayTimeRanAway.ogg"
]
# Calling this function will load the given track, and play it
func play(track_number: int):
	var new_track = load(trackList[track_number])
	_player.stream = new_track
	print(trackList[track_number])
	_player.play()
	pass
func _ready():
	currentTrackNumber  =0
	play(currentTrackNumber)
# Calling this function will stop the music
func stop():
	_player.stop()

func _on_AudioStreamPlayer_finished():
	currentTrackNumber+=1
	if(currentTrackNumber==trackList.size()):
		currentTrackNumber=0
	play(currentTrackNumber)
