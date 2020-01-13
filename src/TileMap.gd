extends TileMap

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
const testare = preload("res://testarea.tscn")

const TILE_SIZE = 64
# Called when the node enters the scene tree for the first time.
func _enter_tree():
	print(get_used_cells_by_id(1))
	place_objects(testare,get_used_cells_by_id(1),false)
	pass # Replace with function body.

func place_objects(object, positions, remove_tile=false):
	for next in positions:
		var new_object = object.instance()
		var pos_x = (next[0]*TILE_SIZE) + (TILE_SIZE/2)
		var pos_y = (next[1]*TILE_SIZE) + (TILE_SIZE/2)
		new_object.global_position = Vector2(pos_x, pos_y)
		add_child(new_object)
		if remove_tile: set_cell(next[0], next[1], -1)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
