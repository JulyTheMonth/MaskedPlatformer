extends TileMap

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
const spikeHitBox = preload("res://src/spike/SpikeHitBox.tscn")

const TILE_SIZE = 16
# Called when the node enters the scene tree for the first time.
func _enter_tree():
	
	print(get_used_cells_by_id(5))
		
	place_objects(spikeHitBox,get_used_cells_by_id(5),false,0)
	place_objects(spikeHitBox,get_used_cells_by_id(6),false,-PI/2)
	place_objects(spikeHitBox,get_used_cells_by_id(7),false,PI)
	place_objects(spikeHitBox,get_used_cells_by_id(8),false,PI/2)
	pass # Replace with function body.

func place_objects(object, positions, remove_tile=false, rotation:float=0):
	for next in positions:
		var new_object = object.instance()
		var pos_x = (next[0]*TILE_SIZE) + (TILE_SIZE/2)
		var pos_y = (next[1]*TILE_SIZE) + (TILE_SIZE/2)
		new_object.global_position = Vector2(pos_x, pos_y)
		new_object.rotation = rotation
		add_child(new_object)
		if remove_tile: set_cell(next[0], next[1], -1)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
