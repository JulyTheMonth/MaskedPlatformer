extends CanvasLayer

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var spriteSize: Vector2
export var color: Color = Color(0,0,0)
# Called when the node enters the scene tree for the first time.
func _ready():
	spriteSize = $TestMask.texture.get_size()
	$TopRect.rect_position = Vector2(0,0) 
	$TopRect.rect_scale.y = -1
	$TopRect.color = color
	
	$LeftRect.rect_position = Vector2(0,spriteSize.y) 
	$LeftRect.rect_scale *= -1
	
	$BottomRect.rect_position = Vector2(spriteSize.x,spriteSize.y) 
	$BottomRect.rect_scale.x *= -1
	
	$RightRect.rect_position = Vector2(spriteSize.x,0) 
	
	$TopRect.color = color
	$BottomRect.color = color
	$RightRect.color = color
	$LeftRect.color = color
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	offset = get_viewport().get_mouse_position() - spriteSize/2
	$TopRect.rect_size.y = offset.y
	$TopRect.rect_size.x = spriteSize.x -offset.x
	
	$LeftRect.rect_size.y = spriteSize.y + offset.y
	$LeftRect.rect_size.x = offset.x
	
	$BottomRect.rect_size.y = -offset.y
	$BottomRect.rect_size.x = spriteSize.x + offset.x
	
	$RightRect.rect_size.y = spriteSize.y - offset.y
	$RightRect.rect_size.x = -offset.x
#	print(offset)
	pass
#	rect_position = get_viewport().get_mouse_position() - spriteSize/2
	
	
	
	
	
