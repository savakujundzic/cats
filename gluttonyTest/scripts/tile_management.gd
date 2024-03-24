extends Node2D

var tilemap : TileMap
var mouseposition : Vector2
var tile_cord : Vector2

var prev := Vector2(0,0)
var toggle := false


func highlight_tiles():
	for i in range(-100,100):
		for j in range(-100,100):
			tilemap.erase_cell(0, Vector2(i,j))
	
	mouseposition = get_local_mouse_position()
	tile_cord = tilemap.local_to_map(mouseposition)
	tilemap.set_cell(0, tile_cord, 4, Vector2(1,2), 0)

func tile_placement() -> void:
	if tile_cord != prev:
		prev = tile_cord
		if toggle:
			tilemap.erase_cell(0, prev)
		print("tile coordinates : ", tile_cord, ",  mouse position : ", mouseposition)
	#if Input.is_action_pressed("LeftClick"):
	mouseposition = get_local_mouse_position()
	tile_cord = tilemap.local_to_map(mouseposition)
	if Input.is_action_pressed("LeftClick"):
		tilemap.set_cell(0, tile_cord, 4, Vector2(1,2), 0)
	if Input.is_action_pressed("RightClick"):
		tilemap.erase_cell(0, tile_cord)
