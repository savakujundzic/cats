extends TileMap

var mouseposition : Vector2
var prev : Vector2 = Vector2(0,0)
var tile_cord : Vector2 = Vector2(0,0)

func _process(delta):
	
	#for i in range(0,3):
	#	for j in range(0,3):
	#		set_cell(0, Vector2(i,j), 4, Vector2(1,2),0)
	set_cell(0, Vector2(0,1), 4, Vector2(1,2), 0)
	set_cell(0, Vector2(0,2), 4, Vector2(0,2), 0)
	set_cell(0, Vector2(1,2), 4, Vector2(1,2), 0)
	set_cell(0, Vector2(0,3), 4, Vector2(1,2), 0)
	set_cell(0, Vector2(0,4), 4, Vector2(1,2), 0)

func tile_placement() -> void:
	if tile_cord != prev:
		prev = tile_cord
		erase_cell(0, prev)
		print("tile coordinates : ", tile_cord, ",  mouse position : ", mouseposition)
	#if Input.is_action_pressed("LeftClick"):
	mouseposition = get_local_mouse_position()
	tile_cord = local_to_map(mouseposition)
	if Input.is_action_pressed("LeftClick"):
		set_cell(0, tile_cord, 4, Vector2(1,2), 0)
	if Input.is_action_pressed("RightClick"):
		erase_cell(0, tile_cord)
