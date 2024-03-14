extends TileMap


@onready var main = $".."
var mine_position
var gridsize = 10
var dictionary = {}
var selectedtile
var add_mines_pressed :bool = false



func _physics_process(delta):
	# You have to check if add_mines is pressed and if it is the bool
	# add_mines_pressed returns true
	if Input.is_action_just_pressed("add_mines"):
		add_mines_pressed = true
		for x in gridsize:
			for y in gridsize:
				dictionary[str(Vector2(x, y))] = {
					"Type" = "Grass"
				}
				set_cell( 0, Vector2(x, y), 1, Vector2i(1, 0), 0)
		#gets access to a tile that the mouse is on top off
		
	MoveMouse()

func MoveMouse():
	# you check if add_mines_pressed is true and if you click left click and then it adds mine
	if add_mines_pressed == true and Input.is_action_just_pressed("LeftClick") :
		var mine = preload("res://scenes/mine.tscn")
		var mine_instance = mine.instantiate()
		mine_position = Vector2(selectedtile)
		mine_instance.position = mine_position
		mine_instance.add_to_group("mine", true)
		main.add_child(mine_instance)


func _process(delta):
	var tile = local_to_map(get_global_mouse_position())
	selectedtile = map_to_local(tile)
	for x in gridsize:
		for y in gridsize:
			erase_cell(1, Vector2(x, y))
		# sets the tile to grass_selected
	if dictionary.has(str(tile)):
		set_cell(1, tile, 2, Vector2i(0, 0), 0)
			

