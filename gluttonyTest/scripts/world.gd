extends TileMap

var mouseposition : Vector2
var prev : Vector2 = Vector2(0,0)
var tile_cord : Vector2 = Vector2(0,0)
@onready var toggle = false

func _process(delta):
	if Input.is_action_pressed("toggle_delete"):
		toggle = !toggle




