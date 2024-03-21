extends TileMap

signal add_mine(mine : Area2D)

@onready var main = $".."
var mine_position
var gridsize = 10
var dictionary = {}
var selectedtile
var add_mines_pressed :bool = false
var no_of_mines : int = 0




func _physics_process(delta):
	for x in gridsize:
		for y in gridsize:
			dictionary[str(Vector2(x, y))] = {
				"Type" = "Grass"
			}
			set_cell( 0, Vector2(x, y), 1, Vector2i(0, 0), 0)

	if Input.is_action_just_pressed("add_mines"):
		add_mines_pressed = true
	MoveMouse()

func MoveMouse():
	# you check if add_mines_pressed is true and if you click left click and then it adds mine
	if add_mines_pressed == true and Input.is_action_just_pressed("LeftClick"):
		var mine = preload("res://scenes/mine.tscn")
		var mine_instance = mine.instantiate()
		mine_position = Vector2(selectedtile) + Vector2(25, -70)
		mine_instance.position = mine_position
		mine_instance.add_to_group("mine", true)
		main.add_child(mine_instance)
		emit_signal("add_mine", mine_instance)

func _process(delta):
	var tile = local_to_map(get_global_mouse_position())
	selectedtile = map_to_local(tile) 
	for x in gridsize:
		for y in gridsize:
			erase_cell(1, Vector2(x, y))
		# sets the tile to grass_selected
	if dictionary.has(str(tile)):
		set_cell(1, tile, 0, Vector2i(0, 0), 0)
			

func _on_mine_placer_toggled(toggled_on):
	if toggled_on == true:
		add_mines_pressed = true
	else:
		add_mines_pressed = false

func _on_mine_placer_mouse_entered():
	add_mines_pressed = false
